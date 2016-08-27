val _ =
    let
	val bufsize = 131072
    	val fd = TextIO.openIn "../data"
        fun read(s: string) =
	    (TextIO.output(TextIO.stdOut,s);
	    if not (TextIO.endOfStream fd)
            then (read(TextIO.inputN(fd,bufsize)); ())
	    else ())
    in
	read(TextIO.inputN(fd,bufsize))
    end
