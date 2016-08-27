-module(cat).
-import(string,[len/1]).
-export([start/0]).

read_blocks(D) ->
    case file:read(D,131072) of
	{ok, Data} ->
	    LEN = len(Data),
	    if 
		LEN > 0 ->
		    io:fwrite(Data),
		    read_blocks(D);
		LEN == 0 ->
		    file:close(D),
		    halt(0)
	    end;
	{error, Reason} ->
	    io:fwrite(Reason)
    end.

readfile(Filename) ->
    case file:open(Filename, [read]) of
	{ok,D} ->
	    read_blocks(D);
	{error,Reason} ->
	    io:fwrite(Reason)
    end.

start() ->
    readfile("../data"),
    halt(0).
