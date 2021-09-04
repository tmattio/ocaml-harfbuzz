let () =
  print_endline "#include <caml/mlvalues.h>";
  print_endline "#include <hb.h>";

  Cstubs_structs.write_c Format.std_formatter
    (module Harfbuzz_c_type_descriptions.Descriptions)
