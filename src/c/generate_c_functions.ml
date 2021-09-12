let () =
  print_endline "#include <caml/mlvalues.h>";
  print_endline "#include <hb.h>";
  Cstubs.write_c
    Format.std_formatter
    ~prefix:Sys.argv.(1)
    (module Harfbuzz_c_function_descriptions.Descriptions)
