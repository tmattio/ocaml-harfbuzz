module Descriptions (F : Ctypes.TYPE) = struct
  open Ctypes
  open F

  module Blob = struct
    type t = [ `Blob ] structure

    let t : t typ = typedef (structure "`Blob") "hb_blob_t"

    type memory_mode =
      [ `DUPLICATE | `READONLY | `WRITABLE | `READONLY_MAY_MAKE_WRITABLE ]

    let duplicate = constant "HB_MEMORY_MODE_DUPLICATE" int64_t

    let readonly = constant "HB_MEMORY_MODE_READONLY" int64_t

    let writable = constant "HB_MEMORY_MODE_WRITABLE" int64_t

    let readonly_may_make_writable =
      constant "HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE" int64_t

    let memory_mode : memory_mode typ =
      enum "hb_memory_mode_t" ~typedef:true
        [
          (`DUPLICATE, duplicate);
          (`READONLY, readonly);
          (`WRITABLE, writable);
          (`READONLY_MAY_MAKE_WRITABLE, readonly_may_make_writable);
        ]
  end
end
