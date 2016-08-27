package main

import ("fmt"
	"io"
	"os")

func main() {
	f, err := os.Open("../data")
	if err != nil {
		fmt.Println(err)
		return
	}
	defer f.Close()
	data := make([]byte, 131072)
	for {
		data = data[:cap(data)]
		n, err := f.Read(data)
		if err != nil {
			if err == io.EOF {
				break
			}
			fmt.Println(err)
			return
		}
		data = data[:n]
		os.Stdout.Write(data)
	}
}
