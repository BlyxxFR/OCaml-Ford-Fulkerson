open Graph
open FordFulkerson

let () =

  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf "\nUsage: %s infile source sink outfile\n\n%!" Sys.argv.(0) ;
      exit 0
    end ;

  let infile = Sys.argv.(1)
  and _source = Sys.argv.(2)
  and _sink = Sys.argv.(3)
  and outfile = Sys.argv.(4) in

  let graph = Gfile.from_file infile in

	let _graph = Graph.map graph (fun v -> v) (fun e -> string_of_int ((int_of_string e) + 2)) in

  (* Rewrite the graph that has been read. *)
  let () = Gfile.export outfile _graph in
	  let () = FordFulkerson.algo _graph _source _sink in
  		()



