BUILD=go ocaml mlton cpp rust java scala haskell erlang
TESTS=c $(BUILD) perl python php racket sbcl nodejs

all: build

test:
	./mktimes $(TESTS)

build:
	for i in $(BUILD); do \
		make -C $i all;	\
	done

version:
	>version
	for i in $(TESTS); do \
		make -C $$i version; \
		echo -n "$$i version\n    -> " >>version; \
		cat $$i/version >>version; \
	done
data:
	dd if=/dev/zero of=data count=10000000


