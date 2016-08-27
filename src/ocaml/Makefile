all:
	ocamlfind ocamlopt -o cat -package unix -linkpkg cat.ml

test:
	./cat ../data >/dev/null

version:
	ocaml -version >version
