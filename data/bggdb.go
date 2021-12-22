package data

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

const (
	FIND_BY_NAME = "select gid, name, ranking, url from game where name like ? order by ranking limit ? offset ?"
)

type BoardgameDB struct {
	Username string
	Password string

	db *sql.DB
}

type Boardgame struct {
	Gid     int32
	Name    string
	Ranking uint32
	Url     string
}

type QueryResult struct {
	Error  error
	Result interface{}
}

func (bg *BoardgameDB) Open() error {
	dsn := fmt.Sprintf("%s:%s@/bgg", bg.Username, bg.Password)

	db, err := sql.Open("mysql", dsn)
	if err != nil {
		return err
	}
	bg.db = db
	return nil
}

func (bg *BoardgameDB) Close() error {
	return bg.db.Close()
}

func (bg *BoardgameDB) FindBoardgamesByName(query string, limit uint32, offset uint32) <-chan *QueryResult {
	c := make(chan *QueryResult)

	go func() {
		pattern := fmt.Sprintf("%%%s%%", query)
		log.Printf("query to run = %v", pattern)

		rows, err := bg.db.Query(FIND_BY_NAME, pattern, limit, offset)
		if err != nil {
			c <- &QueryResult{Error: err}
		}

		defer rows.Close()
		defer close(c)

		for rows.Next() {
			rec := &Boardgame{}
			err := rows.Scan(&rec.Gid, &rec.Name, &rec.Ranking, &rec.Url)
			if err != nil {
				c <- &QueryResult{Error: err}
			}
			c <- &QueryResult{Result: *rec, Error: nil}
		}
	}()

	return c
}
