module Types = Harfbuzz_c_types

module Descriptions (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F

  module Blob = struct
    let create =
      foreign "hb_blob_create"
        (ptr char @-> uint @-> Types.Blob.memory_mode @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning (ptr Types.Blob.t))
  end
end
