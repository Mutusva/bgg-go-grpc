package main

import (
	"fmt"
	"log"
	"net"

	"learngrpc/data"
	bgg "learngrpc/messages"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/reflection"
	"google.golang.org/grpc/status"
)

type BGGServer struct {
	Db data.BoardgameDB
}

func (s *BGGServer) FindBoardgamesByName(req *bgg.FindBoardgamesByNameRequest,
	stream bgg.BoardgameService_FindBoardgamesByNameServer) error {
	query := req.GetQuery()
	limit := req.GetLimit()
	offset := req.GetOffset()
	if limit == 0 {
		limit = 10
	}
	log.Printf("FindBoardgamesByName: query=%s, limit=%d, offset=%d", query, limit, offset)
	// read channel
	c := s.Db.FindBoardgamesByName(query, limit, offset)
	count := uint32(0)
	for res := range c {
		if res.Error != nil {
			return status.Error(
				codes.Internal,
				fmt.Sprintf("FindBoardgamesByName: %v", res.Error),
			)
		}
		rec := res.Result.(data.Boardgame)
		count++
		resp := bgg.FindBoardgamesByNameResponse{
			Count: count,
			Game: &bgg.BoardGame{
				Gid:     rec.Gid,
				Name:    rec.Name,
				Ranking: int32(rec.Ranking),
				Url:     rec.Url,
			},
		}
		stream.Send(&resp)
	}
	return nil
}

func main() {
	// Open a connection to the database
	db := data.BoardgameDB{
		Username: "root",
	}
	log.Printf("Connecting to the boardgame database")
	checkError(db.Open())

	// close the database
	defer db.Close()

	// Create an instance of the gRPC server
	s := grpc.NewServer()

	// Enable reflection
	log.Printf("Enabling reflection\n")
	reflection.Register(s)

	// Create a Boardgame Service
	bggServer := BGGServer{Db: db}

	// Register bggSer as a gRPC service
	bgg.RegisterBoardgameServiceServer(s, &bggServer)

	// open a port for the service
	log.Printf("Opening port 50051\n")
	lis, err := net.Listen("tcp", "0.0.0.0:50051")
	checkError(err)

	log.Printf("Start the Boardgame Service\n")
	checkError(s.Serve(lis))
}

func checkError(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
