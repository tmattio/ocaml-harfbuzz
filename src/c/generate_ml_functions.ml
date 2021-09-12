let () =
  Cstubs.write_ml
    Format.std_formatter
    ~prefix:Sys.argv.(1)
    (module Harfbuzz_c_function_descriptions.Descriptions)
