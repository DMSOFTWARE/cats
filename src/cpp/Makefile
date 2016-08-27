all:
	g++ -o cat cat.cc
test:
	./cat ../data >/dev/null
version:
	g++ -v 2>&1 | tail -n 1 >version
