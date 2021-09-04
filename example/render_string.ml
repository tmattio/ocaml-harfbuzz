Printexc.record_backtrace true

let is_native =
  match Sys.backend_type with
  | Sys.Native -> true
  | Sys.Bytecode -> true
  | _ -> false

let get_executing_directory () =
  match is_native with
  | true -> Filename.dirname Sys.argv.(0) ^ Filename.dir_sep
  | false -> ""

let run () =
  let show ({ glyphId; cluster } : hb_shape) =
    Printf.sprintf "GlyphID: %d Cluster: %d" glyphId cluster
  in
  let render_string ?(features = []) font str =
    let shapes = Harfbuzz.hb_shape ~features font str in
    print_endline ("-- " ^ str ^ " --");
    Array.iter (fun s -> print_endline ("- SHAPE: " ^ show s)) shapes;
    print_endline "----"
  in
  let compiled_version = hb_version_string_compiled () in
  let runtime_version = hb_version_string_runtime () in
  print_endline
    ("** Harfbuzz CLI, compiled version: " ^ compiled_version
   ^ ", runtime version: " ^ runtime_version ^ " **\n");
  print_endline "__ Font Path: Roboto Regular __";
  let result = hb_face_from_path "test/collateral/FiraCode-Regular.ttf" in
  let features =
    [
      (let open Harfbuzz in
      { tag = "dlig"; value = 1; start = `Start; stop = `End });
    ]
  in
  match result with
  | Error msg -> failwith msg
  | Ok font ->
      render_string font "abc";
      render_string font "Harfbuzz";
      render_string font "ff";
      render_string ~features font "ff";
      render_string font "\206\186\225\189\185\207\131\206\188\206\181";
      render_string font "\t"

let () = run ()
