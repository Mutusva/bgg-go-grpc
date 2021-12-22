package main

import (
	"flag"
	"io"
	"log"

	ctx "context"

	"google.golang.org/grpc"

	bgg "learngrpc/messages"
	"learngrpc/util"
)

func main() {
	query := flag.String("query", "", "Boardgame name to search")
	limit := flag.Uint("limit", 10, "Number of results to return")
	offset := flag.Uint("offset", 0, "Cursor into the first result")

	flag.Parse()

	// Open a connection to the service
	log.Printf("Open a connection to the service\n")
	conn, err := grpc.Dial("localhost:50051", grpc.WithInsecure())
	util.CheckError(err)
	defer conn.Close()

	// Create an new client
	client := bgg.NewBoardgameServiceClient(conn)

	// Create the request
	req := &bgg.FindBoardgamesByNameRequest{
		Query:  *query,
		Limit:  uint32(*limit),
		Offset: uint32(*offset),
	}

	log.Printf("Calling FindBoardgamesByName\n")
	log.Printf("Query = %v", req.GetQuery())
	stream, err := client.FindBoardgamesByName(ctx.Background(), req)
	util.CheckError(err)

	for {
		resp, err := stream.Recv()
		// No more result - End Of File
		if io.EOF == err {
			break
		}
		if nil != err {
			util.CheckError(err)
		}
		log.Printf("[%d] %v\n", resp.Count, resp.Game)
	}
}
