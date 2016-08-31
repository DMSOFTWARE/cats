-module(cat).
-export([main/1]).

copy_blocks(In, Out) ->
    case file:read(In, 131072) of
        {ok, Data} ->
            case file:write(Out, Data) of
                ok ->
                    copy_blocks(In, Out);
                {error, _Reason} = Error ->
                    Error
            end;
        eof ->
            ok;
        {error, _Reason} = Error ->
            Error
    end.

copy_file(FileNameIn, FileNameOut) ->
    {ok, IoDeviceIn} = file:open(FileNameIn, [read, raw, binary]),
    {ok, IoDeviceOut} = file:open(FileNameOut, [write, raw, binary]),
    ok = copy_blocks(IoDeviceIn, IoDeviceOut),
    ok = file:close(IoDeviceIn),
    ok = file:close(IoDeviceOut).

main([Path]) ->
    copy_file(Path, "/dev/stdout").
