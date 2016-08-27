open Unix

let buffer = String.make 131072 ' '

let _ =
  let fd = openfile Sys.argv.(1) [O_RDONLY] 0o644 in
  try
    let n = ref 0 in
    while true do
      (* Тут какая-то херня, какое-то внутреннее ограничение на
	 размер буфера срабатывает в 65536 (видно по strace), в
	 результате чего OCaml не ускоряется.
      *)
      n := Unix.read fd buffer 0 131072;
      if !n = 0 then
	raise End_of_file;
      ignore(Unix.write Unix.stdout buffer 0 !n);
    done
  with End_of_file ->
    Unix.close fd
