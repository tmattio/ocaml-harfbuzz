module Types = Harfbuzz_c_types

module Descriptions (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F

  module Common = struct
    let tag_from_string =
      foreign
        "hb_tag_from_string"
        (string @-> int @-> returning Types.Common.tag)

    let tag_to_string =
      foreign "hb_tag_to_string" (Types.Common.tag @-> string @-> returning void)

    let direction_from_string =
      foreign
        "hb_direction_from_string"
        (string @-> int @-> returning Types.Common.Direction.t)

    let direction_to_string =
      foreign
        "hb_direction_to_string"
        (Types.Common.Direction.t @-> returning string)

    let script_from_iso15924_tag =
      foreign
        "hb_script_from_iso15924_tag"
        (Types.Common.tag @-> returning Types.Common.Script.t)

    let script_from_string =
      foreign
        "hb_script_from_string"
        (string @-> int @-> returning Types.Common.Script.t)

    let script_to_iso15924_tag =
      foreign
        "hb_script_to_iso15924_tag"
        (Types.Common.Script.t @-> returning Types.Common.tag)

    let script_get_horizontal_direction =
      foreign
        "hb_script_get_horizontal_direction"
        (Types.Common.Script.t @-> returning Types.Common.Direction.t)

    let language_from_string =
      foreign
        "hb_language_from_string"
        (string @-> int @-> returning Types.Common.language)

    let language_to_string =
      foreign
        "hb_language_to_string"
        (Types.Common.language @-> returning string)

    let language_get_default =
      foreign
        "hb_language_get_default"
        (void @-> returning Types.Common.language)

    let feature_from_string =
      foreign
        "hb_feature_from_string"
        (string
        @-> int
        @-> ptr Types.Common.Feature.t
        @-> returning Types.Common.bool)

    let feature_to_string =
      foreign
        "hb_feature_to_string"
        (ptr Types.Common.Feature.t @-> string @-> uint @-> returning void)

    let variation_from_string =
      foreign
        "hb_variation_from_string"
        (string
        @-> int
        @-> ptr Types.Common.Variation.t
        @-> returning Types.Common.bool)

    let variation_to_string =
      foreign
        "hb_variation_to_string"
        (ptr Types.Common.Variation.t @-> string @-> uint @-> returning void)
  end

  module Buffer = struct
    let create =
      foreign "hb_buffer_create" (void @-> returning (ptr Types.Buffer.t))

    let reference =
      foreign
        "hb_buffer_reference"
        (ptr Types.Buffer.t @-> returning (ptr Types.Buffer.t))

    let get_empty =
      foreign "hb_buffer_get_empty" (void @-> returning (ptr Types.Buffer.t))

    let destroy =
      foreign "hb_buffer_destroy" (ptr Types.Buffer.t @-> returning void)

    let reset = foreign "hb_buffer_reset" (ptr Types.Buffer.t @-> returning void)

    let clear_contents =
      foreign "hb_buffer_clear_contents" (ptr Types.Buffer.t @-> returning void)

    let pre_allocate =
      foreign
        "hb_buffer_pre_allocate"
        (ptr Types.Buffer.t @-> uint @-> returning Types.Common.bool)

    let allocation_successful =
      foreign
        "hb_buffer_allocation_successful"
        (ptr Types.Buffer.t @-> returning Types.Common.bool)

    let add =
      foreign
        "hb_buffer_add"
        (ptr Types.Buffer.t
        @-> Types.Common.codepoint
        @-> uint
        @-> returning void)

    let add_codepoints =
      foreign
        "hb_buffer_add_codepoints"
        (ptr Types.Buffer.t
        @-> ptr Types.Common.codepoint
        @-> int
        @-> uint
        @-> int
        @-> returning void)

    let add_utf32 =
      foreign
        "hb_buffer_add_utf32"
        (ptr Types.Buffer.t
        @-> ptr uint32_t
        @-> int
        @-> uint
        @-> int
        @-> returning void)

    let add_utf16 =
      foreign
        "hb_buffer_add_utf16"
        (ptr Types.Buffer.t
        @-> ptr uint16_t
        @-> int
        @-> uint
        @-> int
        @-> returning void)

    let add_utf8 =
      foreign
        "hb_buffer_add_utf8"
        (ptr Types.Buffer.t
        @-> string
        @-> int
        @-> uint
        @-> int
        @-> returning void)

    let add_latin1 =
      foreign
        "hb_buffer_add_latin1"
        (ptr Types.Buffer.t
        @-> ptr uint8_t
        @-> int
        @-> uint
        @-> int
        @-> returning void)

    let append =
      foreign
        "hb_buffer_append"
        (ptr Types.Buffer.t
        @-> ptr Types.Buffer.t
        @-> uint
        @-> uint
        @-> returning void)

    let set_content_type =
      foreign
        "hb_buffer_set_content_type"
        (ptr Types.Buffer.t @-> Types.Buffer.Content_type.t @-> returning void)

    let get_content_type =
      foreign
        "hb_buffer_get_content_type"
        (ptr Types.Buffer.t @-> returning Types.Buffer.Content_type.t)

    let set_direction =
      foreign
        "hb_buffer_set_direction"
        (ptr Types.Buffer.t @-> Types.Common.Direction.t @-> returning void)

    let get_direction =
      foreign
        "hb_buffer_get_direction"
        (ptr Types.Buffer.t @-> returning Types.Common.Direction.t)

    let set_script =
      foreign
        "hb_buffer_set_script"
        (ptr Types.Buffer.t @-> Types.Common.Script.t @-> returning void)

    let get_script =
      foreign
        "hb_buffer_get_script"
        (ptr Types.Buffer.t @-> returning Types.Common.Script.t)

    let set_language =
      foreign
        "hb_buffer_set_language"
        (ptr Types.Buffer.t @-> Types.Common.language @-> returning void)

    let get_language =
      foreign
        "hb_buffer_get_language"
        (ptr Types.Buffer.t @-> returning Types.Common.language)

    let set_flags =
      foreign
        "hb_buffer_set_flags"
        (ptr Types.Buffer.t @-> Types.Buffer.Flags.t @-> returning void)

    let get_flags =
      foreign
        "hb_buffer_get_flags"
        (ptr Types.Buffer.t @-> returning Types.Buffer.Flags.t)

    let set_cluster_level =
      foreign
        "hb_buffer_set_cluster_level"
        (ptr Types.Buffer.t @-> Types.Buffer.Cluster_level.t @-> returning void)

    let get_cluster_level =
      foreign
        "hb_buffer_get_cluster_level"
        (ptr Types.Buffer.t @-> returning Types.Buffer.Cluster_level.t)

    let set_length =
      foreign
        "hb_buffer_set_length"
        (ptr Types.Buffer.t @-> uint @-> returning void)

    let get_length =
      foreign "hb_buffer_get_length" (ptr Types.Buffer.t @-> returning uint)

    let set_segment_properties =
      foreign
        "hb_buffer_set_segment_properties"
        (ptr Types.Buffer.t
        @-> ptr Types.Buffer.Segment_property.t
        @-> returning void)

    let get_segment_properties =
      foreign
        "hb_buffer_get_segment_properties"
        (ptr Types.Buffer.t
        @-> ptr Types.Buffer.Segment_property.t
        @-> returning void)

    let guess_segment_properties =
      foreign
        "hb_buffer_guess_segment_properties"
        (ptr Types.Buffer.t @-> returning void)

    let set_unicode_funcs =
      foreign
        "hb_buffer_set_unicode_funcs"
        (ptr Types.Buffer.t @-> ptr Types.Unicode.funcs @-> returning void)

    let get_unicode_funcs =
      foreign
        "hb_buffer_get_unicode_funcs"
        (ptr Types.Buffer.t @-> returning (ptr Types.Unicode.funcs))

    let set_user_data =
      foreign
        "hb_buffer_set_user_data"
        (ptr Types.Buffer.t
        @-> ptr Types.Common.user_data_key
        @-> ptr void
        @-> static_funptr Ctypes.(void @-> returning void)
        @-> Types.Common.bool
        @-> returning Types.Common.bool)

    let get_user_data =
      foreign
        "hb_buffer_get_user_data"
        (ptr Types.Buffer.t
        @-> ptr Types.Common.user_data_key
        @-> returning (ptr void))

    let get_glyph_infos =
      foreign
        "hb_buffer_get_glyph_infos"
        (ptr Types.Buffer.t
        @-> ptr uint
        @-> returning (ptr Types.Buffer.Glyph_info.t))

    let get_glyph_positions =
      foreign
        "hb_buffer_get_glyph_positions"
        (ptr Types.Buffer.t
        @-> ptr uint
        @-> returning (ptr Types.Buffer.Glyph_position.t))

    let has_positions =
      foreign
        "hb_buffer_has_positions"
        (ptr Types.Buffer.t @-> returning Types.Common.bool)

    let get_invisible_glyph =
      foreign
        "hb_buffer_get_invisible_glyph"
        (ptr Types.Buffer.t @-> returning Types.Common.codepoint)

    let set_invisible_glyph =
      foreign
        "hb_buffer_set_invisible_glyph"
        (ptr Types.Buffer.t @-> Types.Common.codepoint @-> returning void)

    let set_replacement_codepoint =
      foreign
        "hb_buffer_set_replacement_codepoint"
        (ptr Types.Buffer.t @-> Types.Common.codepoint @-> returning void)

    let get_replacement_codepoint =
      foreign
        "hb_buffer_get_replacement_codepoint"
        (ptr Types.Buffer.t @-> returning Types.Common.codepoint)

    let normalize_glyphs =
      foreign
        "hb_buffer_normalize_glyphs"
        (ptr Types.Buffer.t @-> returning void)

    let reverse =
      foreign "hb_buffer_reverse" (ptr Types.Buffer.t @-> returning void)

    let reverse_range =
      foreign
        "hb_buffer_reverse_range"
        (ptr Types.Buffer.t @-> uint @-> uint @-> returning void)

    let reverse_clusters =
      foreign
        "hb_buffer_reverse_clusters"
        (ptr Types.Buffer.t @-> returning void)

    let serialize =
      foreign
        "hb_buffer_serialize"
        (ptr Types.Buffer.t
        @-> uint
        @-> uint
        @-> string
        @-> uint
        @-> ptr uint
        @-> ptr Types.Font.t
        @-> Types.Buffer.Serialize_format.t
        @-> Types.Buffer.Serialize_flags.t
        @-> returning uint)

    let serialize_glyphs =
      foreign
        "hb_buffer_serialize_glyphs"
        (ptr Types.Buffer.t
        @-> uint
        @-> uint
        @-> string
        @-> uint
        @-> ptr uint
        @-> ptr Types.Font.t
        @-> Types.Buffer.Serialize_format.t
        @-> Types.Buffer.Serialize_flags.t
        @-> returning void)

    let deserialize_glyphs =
      foreign
        "hb_buffer_deserialize_glyphs"
        (ptr Types.Buffer.t
        @-> string
        @-> int
        @-> ptr string
        @-> ptr Types.Font.t
        @-> Types.Buffer.Serialize_format.t
        @-> returning Types.Common.bool)

    let serialize_unicode =
      foreign
        "hb_buffer_serialize_unicode"
        (ptr Types.Buffer.t
        @-> uint
        @-> uint
        @-> string
        @-> uint
        @-> ptr uint
        @-> Types.Buffer.Serialize_format.t
        @-> Types.Buffer.Serialize_flags.t
        @-> returning uint)

    let deserialize_unicode =
      foreign
        "hb_buffer_deserialize_unicode"
        (ptr Types.Buffer.t
        @-> string
        @-> int
        @-> ptr string
        @-> Types.Buffer.Serialize_format.t
        @-> returning Types.Common.bool)

    let serialize_format_from_string =
      foreign
        "hb_buffer_serialize_format_from_string"
        (string @-> int @-> returning Types.Buffer.Serialize_format.t)

    let serialize_format_to_string =
      foreign
        "hb_buffer_serialize_format_to_string"
        (Types.Buffer.Serialize_format.t @-> returning string)

    let serialize_list_formats =
      foreign
        "hb_buffer_serialize_list_formats"
        (void @-> returning (ptr string))

    let segment_properties_equal =
      foreign
        "hb_segment_properties_equal"
        (ptr Types.Buffer.Segment_property.t
        @-> ptr Types.Buffer.Segment_property.t
        @-> returning Types.Common.bool)

    let segment_properties_hash =
      foreign
        "hb_segment_properties_hash"
        (ptr Types.Buffer.Segment_property.t @-> returning uint)

    (* let diff = foreign "hb_buffer_diff" (ptr Types.Buffer.t @-> ptr
       Types.Buffer.t @-> Types.Common.codepoint @-> uint @-> returning
       Types.Buffer.Diff_flags.t) *)

    let set_message_func =
      foreign
        "hb_buffer_set_message_func"
        (ptr Types.Buffer.t
        @-> static_funptr
              Ctypes.(
                ptr Types.Buffer.t
                @-> ptr Types.Font.t
                @-> string
                @-> ptr void
                @-> returning Types.Common.bool)
        @-> ptr void
        @-> static_funptr Ctypes.(void @-> returning void)
        @-> returning void)

    let glyph_info_get_glyph_flags =
      foreign
        "hb_glyph_info_get_glyph_flags"
        (ptr Types.Buffer.Glyph_info.t @-> returning Types.Buffer.Glyph_flags.t)
  end

  module Blob = struct
    let create =
      foreign
        "hb_blob_create"
        (string
        @-> uint
        @-> Types.Blob.Memory_mode.t
        @-> ptr void
        @-> static_funptr Ctypes.(void @-> returning void)
        @-> returning (ptr Types.Blob.t))

    let create_or_fail =
      foreign
        "hb_blob_create_or_fail"
        (string
        @-> uint
        @-> Types.Blob.Memory_mode.t
        @-> ptr void
        @-> static_funptr Ctypes.(void @-> returning void)
        @-> returning (ptr Types.Blob.t))

    let create_from_file =
      foreign
        "hb_blob_create_from_file"
        (string @-> returning (ptr Types.Blob.t))

    let create_from_file_or_fail =
      foreign
        "hb_blob_create_from_file_or_fail"
        (string @-> returning (ptr Types.Blob.t))

    let create_sub_blob =
      foreign
        "hb_blob_create_sub_blob"
        (ptr Types.Blob.t @-> uint @-> uint @-> returning (ptr Types.Blob.t))

    let copy_writable_or_fail =
      foreign
        "hb_blob_copy_writable_or_fail"
        (ptr Types.Blob.t @-> returning (ptr Types.Blob.t))

    let destroy = foreign "hb_blob_destroy" (ptr Types.Blob.t @-> returning void)

    let get_data =
      foreign
        "hb_blob_get_data"
        (ptr Types.Blob.t @-> ptr uint @-> returning string)

    let get_data_writable =
      foreign
        "hb_blob_get_data_writable"
        (ptr Types.Blob.t @-> ptr uint @-> returning string)

    let get_empty =
      foreign "hb_blob_get_empty" (void @-> returning (ptr Types.Blob.t))

    let get_length =
      foreign "hb_blob_get_length" (ptr Types.Blob.t @-> returning uint)

    let get_user_data =
      foreign
        "hb_blob_get_user_data"
        (ptr Types.Blob.t
        @-> ptr Types.Common.user_data_key
        @-> returning (ptr void))

    let is_immutable =
      foreign
        "hb_blob_is_immutable"
        (ptr Types.Blob.t @-> returning Types.Common.bool)

    let make_immutable =
      foreign "hb_blob_make_immutable" (ptr Types.Blob.t @-> returning void)

    let reference =
      foreign
        "hb_blob_reference"
        (ptr Types.Blob.t @-> returning (ptr Types.Blob.t))

    let set_user_data =
      foreign
        "hb_blob_set_user_data"
        (ptr Types.Blob.t
        @-> ptr Types.Common.user_data_key
        @-> ptr void
        @-> static_funptr Ctypes.(void @-> returning void)
        @-> Types.Common.bool
        @-> returning Types.Common.bool)
  end

  module Face = struct
    let count = foreign "hb_face_count" (ptr Types.Blob.t @-> returning uint)

    let create =
      foreign
        "hb_face_create"
        (ptr Types.Blob.t @-> uint @-> returning (ptr Types.Face.t))

    let create_for_tables =
      foreign
        "hb_face_create_for_tables"
        (static_funptr
           Ctypes.(
             ptr Types.Face.t
             @-> Types.Common.tag
             @-> ptr void
             @-> returning (ptr Types.Blob.t))
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning (ptr Types.Face.t))

    let destroy = foreign "hb_face_destroy" (ptr Types.Face.t @-> returning void)

    let get_empty =
      foreign "hb_face_get_empty" (void @-> returning (ptr Types.Face.t))

    let get_table_tags =
      foreign
        "hb_face_get_table_tags"
        (ptr Types.Face.t
        @-> uint
        @-> ptr uint
        @-> ptr Types.Common.tag
        @-> returning uint)

    let get_glyph_count =
      foreign "hb_face_get_glyph_count" (ptr Types.Face.t @-> returning uint)

    let get_index =
      foreign "hb_face_get_index" (ptr Types.Face.t @-> returning uint)

    let get_upem =
      foreign "hb_face_get_upem" (ptr Types.Face.t @-> returning uint)

    let get_user_data =
      foreign
        "hb_face_get_user_data"
        (ptr Types.Face.t
        @-> ptr Types.Common.user_data_key
        @-> returning (ptr void))

    let is_immutable =
      foreign
        "hb_face_is_immutable"
        (ptr Types.Face.t @-> returning Types.Common.bool)

    let make_immutable =
      foreign "hb_face_make_immutable" (ptr Types.Face.t @-> returning void)

    let reference =
      foreign
        "hb_face_reference"
        (ptr Types.Face.t @-> returning (ptr Types.Face.t))

    let reference_blob =
      foreign
        "hb_face_reference_blob"
        (ptr Types.Face.t @-> returning (ptr Types.Blob.t))

    let reference_table =
      foreign
        "hb_face_reference_table"
        (ptr Types.Face.t @-> Types.Common.tag @-> returning (ptr Types.Blob.t))

    let set_glyph_count =
      foreign
        "hb_face_set_glyph_count"
        (ptr Types.Face.t @-> uint @-> returning void)

    let set_index =
      foreign "hb_face_set_index" (ptr Types.Face.t @-> uint @-> returning void)

    let set_upem =
      foreign "hb_face_set_upem" (ptr Types.Face.t @-> uint @-> returning void)

    let set_user_data =
      foreign
        "hb_face_set_user_data"
        (ptr Types.Face.t
        @-> ptr Types.Common.user_data_key
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> Types.Common.bool
        @-> returning void)

    let collect_unicodes =
      foreign
        "hb_face_collect_unicodes"
        (ptr Types.Face.t @-> ptr Types.Set.t @-> returning void)

    let collect_variation_selectors =
      foreign
        "hb_face_collect_variation_selectors"
        (ptr Types.Face.t @-> ptr Types.Set.t @-> returning void)

    let collect_variation_unicodes =
      foreign
        "hb_face_collect_variation_unicodes"
        (ptr Types.Face.t
        @-> Types.Common.codepoint
        @-> ptr Types.Set.t
        @-> returning void)

    let builder_create =
      foreign "hb_face_builder_create" (void @-> returning (ptr Types.Face.t))

    let builder_add_table =
      foreign
        "hb_face_builder_add_table"
        (ptr Types.Face.t
        @-> Types.Common.tag
        @-> ptr Types.Blob.t
        @-> returning Types.Common.bool)
  end

  module Fonts = struct
    let add_glyph_origin_for_direction =
      foreign
        "hb_font_add_glyph_origin_for_direction"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> Types.Common.Direction.t
        @-> ptr Types.Common.position
        @-> ptr Types.Common.position
        @-> returning void)

    let create =
      foreign
        "hb_font_create"
        (ptr Types.Face.t @-> returning (ptr Types.Font.t))

    let create_sub_font =
      foreign
        "hb_font_create_sub_font"
        (ptr Types.Font.t @-> returning (ptr Types.Font.t))

    let destroy = foreign "hb_font_destroy" (ptr Types.Font.t @-> returning void)

    let funcs_create =
      foreign "hb_font_funcs_create" (void @-> returning (ptr Types.Font.funcs))

    let funcs_destroy =
      foreign "hb_font_funcs_destroy" (ptr Types.Font.funcs @-> returning void)

    let funcs_get_empty =
      foreign
        "hb_font_funcs_get_empty"
        (void @-> returning (ptr Types.Font.funcs))

    let funcs_get_user_data =
      foreign
        "hb_font_funcs_get_user_data"
        (ptr Types.Font.funcs
        @-> ptr Types.Common.user_data_key
        @-> returning (ptr void))

    let funcs_is_immutable =
      foreign
        "hb_font_funcs_is_immutable"
        (ptr Types.Font.funcs @-> returning Types.Common.bool)

    let funcs_make_immutable =
      foreign
        "hb_font_funcs_make_immutable"
        (ptr Types.Font.funcs @-> returning void)

    let funcs_reference =
      foreign
        "hb_font_funcs_reference"
        (ptr Types.Font.funcs @-> returning (ptr Types.Font.funcs))

    let funcs_set_glyph_contour_point_func =
      foreign
        "hb_font_funcs_set_glyph_contour_point_func"
        (ptr Types.Font.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Font.t
                @-> ptr void
                @-> Types.Common.codepoint
                @-> uint
                @-> ptr Types.Common.position
                @-> ptr Types.Common.position
                @-> ptr void
                @-> returning Types.Common.bool)
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_glyph_extents_func =
      foreign
        "hb_font_funcs_set_glyph_extents_func"
        (ptr Types.Font.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Font.t
                @-> ptr void
                @-> Types.Common.codepoint
                @-> ptr Types.Font.Glyph_extents.t
                @-> ptr void
                @-> returning Types.Common.bool)
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_glyph_from_name_func =
      foreign
        "hb_font_funcs_set_glyph_from_name_func"
        (ptr Types.Font.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Font.t
                @-> ptr void
                @-> string
                @-> int
                @-> returning Types.Common.bool)
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_glyph_h_advance_func =
      foreign
        "hb_font_funcs_set_glyph_h_advance_func"
        (ptr Types.Font.funcs
        @-> Types.Font.get_glyph_h_advance_func
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_glyph_h_advances_func =
      foreign
        "hb_font_funcs_set_glyph_h_advances_func"
        (ptr Types.Font.funcs
        @-> Types.Font.get_glyph_h_advances_func
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_glyph_h_kerning_func =
      foreign
        "hb_font_funcs_set_glyph_h_kerning_func"
        (ptr Types.Font.funcs
        @-> Types.Font.get_glyph_h_kerning_func
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_glyph_h_origin_func =
      foreign
        "hb_font_funcs_set_glyph_h_origin_func"
        (ptr Types.Font.funcs
        @-> Types.Font.get_glyph_h_origin_func
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_glyph_name_func =
      foreign
        "hb_font_funcs_set_glyph_name_func"
        (ptr Types.Font.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Font.t
                @-> ptr void
                @-> Types.Common.codepoint
                @-> string
                @-> uint
                @-> ptr void
                @-> returning Types.Common.bool)
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_glyph_v_advance_func =
      foreign
        "hb_font_funcs_set_glyph_v_advance_func"
        (ptr Types.Font.funcs
        @-> Types.Font.get_glyph_v_advance_func
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_glyph_v_advances_func =
      foreign
        "hb_font_funcs_set_glyph_v_advances_func"
        (ptr Types.Font.funcs
        @-> Types.Font.get_glyph_v_advances_func
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_glyph_v_origin_func =
      foreign
        "hb_font_funcs_set_glyph_v_origin_func"
        (ptr Types.Font.funcs
        @-> Types.Font.get_glyph_v_origin_func
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_nominal_glyph_func =
      foreign
        "hb_font_funcs_set_nominal_glyph_func"
        (ptr Types.Font.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Font.t
                @-> ptr void
                @-> Types.Common.codepoint
                @-> ptr Types.Common.codepoint
                @-> ptr void
                @-> returning Types.Common.bool)
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    (* TODO(tmattio): Not API definition for
       [hb_font_get_nominal_glyphs_func_t] *)
    (* let funcs_set_nominal_glyphs_func = foreign
       "hb_font_funcs_set_nominal_glyphs_func" (ptr Types.Font.funcs @->
       static_funptr Ctypes.( ptr Types.Font.t @-> ptr void @->
       Types.Common.codepoint @-> ptr Types.Common.codepoint @-> ptr void @->
       returning Types.Common.bool) @-> ptr void @-> static_funptr Ctypes.(ptr
       void @-> returning void) @-> returning void) *)

    let funcs_set_user_data =
      foreign
        "hb_font_funcs_set_user_data"
        (ptr Types.Font.funcs
        @-> ptr Types.Common.user_data_key
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> Types.Common.bool
        @-> returning Types.Common.bool)

    let funcs_set_variation_glyph_func =
      foreign
        "hb_font_funcs_set_variation_glyph_func"
        (ptr Types.Font.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Font.t
                @-> ptr void
                @-> Types.Common.codepoint
                @-> Types.Common.codepoint
                @-> ptr Types.Common.codepoint
                @-> returning (ptr void))
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let get_empty =
      foreign "hb_font_get_empty" (void @-> returning (ptr Types.Font.t))

    let get_face =
      foreign
        "hb_font_get_face"
        (ptr Types.Font.t @-> returning (ptr Types.Face.t))

    let get_glyph =
      foreign
        "hb_font_get_glyph"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> Types.Common.codepoint
        @-> ptr Types.Common.codepoint
        @-> returning Types.Common.bool)

    let get_glyph_advance_for_direction =
      foreign
        "hb_font_get_glyph_advance_for_direction"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> Types.Common.Direction.t
        @-> ptr Types.Common.position
        @-> ptr Types.Common.position
        @-> returning void)

    let get_glyph_advances_for_direction =
      foreign
        "hb_font_get_glyph_advances_for_direction"
        (ptr Types.Font.t
        @-> Types.Common.Direction.t
        @-> uint
        @-> ptr Types.Common.codepoint
        @-> uint
        @-> ptr Types.Common.position
        @-> uint
        @-> returning void)

    let get_glyph_contour_point =
      foreign
        "hb_font_get_glyph_contour_point"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> uint
        @-> ptr Types.Common.position
        @-> ptr Types.Common.position
        @-> returning Types.Common.bool)

    let get_glyph_contour_point_for_origin =
      foreign
        "hb_font_get_glyph_contour_point_for_origin"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> uint
        @-> Types.Common.Direction.t
        @-> ptr Types.Common.position
        @-> ptr Types.Common.position
        @-> returning Types.Common.bool)

    let get_glyph_extents =
      foreign
        "hb_font_get_glyph_extents"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> ptr Types.Font.Glyph_extents.t
        @-> returning Types.Common.bool)

    let get_glyph_extents_for_origin =
      foreign
        "hb_font_get_glyph_extents_for_origin"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> Types.Common.Direction.t
        @-> ptr Types.Font.Glyph_extents.t
        @-> returning Types.Common.bool)

    let get_glyph_from_name =
      foreign
        "hb_font_get_glyph_from_name"
        (ptr Types.Font.t
        @-> string
        @-> int
        @-> ptr Types.Common.codepoint
        @-> returning Types.Common.bool)

    let get_glyph_h_advance =
      foreign
        "hb_font_get_glyph_h_advance"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> returning Types.Common.position)

    let get_glyph_h_advances =
      foreign
        "hb_font_get_glyph_h_advances"
        (ptr Types.Font.t
        @-> uint
        @-> ptr Types.Common.codepoint
        @-> uint
        @-> ptr Types.Common.position
        @-> uint
        @-> returning void)

    let get_glyph_h_kerning =
      foreign
        "hb_font_get_glyph_h_kerning"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> Types.Common.codepoint
        @-> returning Types.Common.position)

    let get_glyph_h_origin =
      foreign
        "hb_font_get_glyph_h_origin"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> ptr Types.Common.position
        @-> ptr Types.Common.position
        @-> returning Types.Common.bool)

    let get_glyph_kerning_for_direction =
      foreign
        "hb_font_get_glyph_kerning_for_direction"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> Types.Common.codepoint
        @-> Types.Common.Direction.t
        @-> ptr Types.Common.position
        @-> ptr Types.Common.position
        @-> returning void)

    let get_glyph_name =
      foreign
        "hb_font_get_glyph_name"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> string
        @-> uint
        @-> returning Types.Common.bool)

    let get_glyph_origin_for_direction =
      foreign
        "hb_font_get_glyph_origin_for_direction"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> Types.Common.Direction.t
        @-> ptr Types.Common.position
        @-> ptr Types.Common.position
        @-> returning void)

    let get_glyph_v_advance =
      foreign
        "hb_font_get_glyph_v_advance"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> returning Types.Common.position)

    let get_glyph_v_advances =
      foreign
        "hb_font_get_glyph_v_advances"
        (ptr Types.Font.t
        @-> uint
        @-> ptr Types.Common.codepoint
        @-> uint
        @-> ptr Types.Common.position
        @-> uint
        @-> returning void)

    let get_glyph_v_origin =
      foreign
        "hb_font_get_glyph_v_origin"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> ptr Types.Common.position
        @-> ptr Types.Common.position
        @-> returning Types.Common.bool)

    let get_nominal_glyph =
      foreign
        "hb_font_get_nominal_glyph"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> ptr Types.Common.codepoint
        @-> returning Types.Common.bool)

    let get_nominal_glyphs =
      foreign
        "hb_font_get_nominal_glyphs"
        (ptr Types.Font.t
        @-> uint
        @-> ptr Types.Common.codepoint
        @-> uint
        @-> ptr Types.Common.codepoint
        @-> uint
        @-> returning uint)

    let get_parent =
      foreign
        "hb_font_get_parent"
        (ptr Types.Font.t @-> returning (ptr Types.Font.t))

    let get_ppem =
      foreign
        "hb_font_get_ppem"
        (ptr Types.Font.t @-> ptr uint @-> ptr uint @-> returning void)

    let get_ptem =
      foreign "hb_font_get_ptem" (ptr Types.Font.t @-> returning float)

    let get_scale =
      foreign
        "hb_font_get_scale"
        (ptr Types.Font.t @-> ptr int @-> ptr int @-> returning void)

    let get_user_data =
      foreign
        "hb_font_get_user_data"
        (ptr Types.Font.t
        @-> ptr Types.Common.user_data_key
        @-> returning (ptr void))

    let get_variation_glyph =
      foreign
        "hb_font_get_variation_glyph"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> Types.Common.codepoint
        @-> ptr Types.Common.codepoint
        @-> returning void)

    let get_var_coords_normalized =
      foreign
        "hb_font_get_var_coords_normalized"
        (ptr Types.Font.t @-> ptr uint @-> returning (ptr int))

    let glyph_from_string =
      foreign
        "hb_font_glyph_from_string"
        (ptr Types.Font.t
        @-> string
        @-> int
        @-> ptr Types.Common.codepoint
        @-> returning Types.Common.bool)

    let glyph_to_string =
      foreign
        "hb_font_glyph_to_string"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> string
        @-> uint
        @-> returning void)

    let is_immutable =
      foreign
        "hb_font_is_immutable"
        (ptr Types.Font.t @-> returning Types.Common.bool)

    let make_immutable =
      foreign "hb_font_make_immutable" (ptr Types.Font.t @-> returning void)

    let reference =
      foreign
        "hb_font_reference"
        (ptr Types.Font.t @-> returning (ptr Types.Font.t))

    let set_face =
      foreign
        "hb_font_set_face"
        (ptr Types.Font.t @-> ptr Types.Face.t @-> returning void)

    let set_funcs =
      foreign
        "hb_font_set_funcs"
        (ptr Types.Font.t
        @-> ptr Types.Font.funcs
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let set_funcs_data =
      foreign
        "hb_font_set_funcs_data"
        (ptr Types.Font.t
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let set_parent =
      foreign
        "hb_font_set_parent"
        (ptr Types.Font.t @-> ptr Types.Font.t @-> returning void)

    let set_ppem =
      foreign
        "hb_font_set_ppem"
        (ptr Types.Font.t @-> ptr uint @-> ptr uint @-> returning void)

    let set_ptem =
      foreign "hb_font_set_ptem" (ptr Types.Font.t @-> float @-> returning void)

    let set_scale =
      foreign
        "hb_font_set_scale"
        (ptr Types.Font.t @-> int @-> int @-> returning void)

    let set_user_data =
      foreign
        "hb_font_set_user_data"
        (ptr Types.Font.t
        @-> ptr Types.Common.user_data_key
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> Types.Common.bool
        @-> returning Types.Common.bool)

    let set_variations =
      foreign
        "hb_font_set_variations"
        (ptr Types.Font.t
        @-> ptr Types.Common.Variation.t
        @-> uint
        @-> returning void)

    let set_var_coords_design =
      foreign
        "hb_font_set_var_coords_design"
        (ptr Types.Font.t @-> ptr float @-> uint @-> returning void)

    let set_var_coords_normalized =
      foreign
        "hb_font_set_var_coords_normalized"
        (ptr Types.Font.t @-> ptr int @-> uint @-> returning void)

    let set_var_named_instance =
      foreign
        "hb_font_set_var_named_instance"
        (ptr Types.Font.t @-> uint @-> returning void)

    let subtract_glyph_origin_for_direction =
      foreign
        "hb_font_subtract_glyph_origin_for_direction"
        (ptr Types.Font.t
        @-> Types.Common.codepoint
        @-> Types.Common.Direction.t
        @-> ptr Types.Common.position
        @-> ptr Types.Common.position
        @-> returning void)

    let funcs_set_font_h_extents_func =
      foreign
        "hb_font_funcs_set_font_h_extents_func"
        (ptr Types.Font.t
        @-> Types.Font.get_font_h_extents_func
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_font_v_extents_func =
      foreign
        "hb_font_funcs_set_font_v_extents_func"
        (ptr Types.Font.t
        @-> Types.Font.get_font_v_extents_func
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let get_extents_for_direction =
      foreign
        "hb_font_get_extents_for_direction"
        (ptr Types.Font.t
        @-> Types.Common.Direction.t
        @-> ptr Types.Font.Glyph_extents.t
        @-> returning void)

    let get_h_extents =
      foreign
        "hb_font_get_h_extents"
        (ptr Types.Font.t
        @-> ptr Types.Font.Glyph_extents.t
        @-> returning Types.Common.bool)

    let get_v_extents =
      foreign
        "hb_font_get_v_extents"
        (ptr Types.Font.t
        @-> ptr Types.Font.Glyph_extents.t
        @-> returning Types.Common.bool)
  end

  module Map = struct
    let allocation_successful =
      foreign
        "hb_map_allocation_successful"
        (ptr Types.Map.t @-> returning Types.Common.bool)

    let clear = foreign "hb_map_clear" (ptr Types.Map.t @-> returning void)

    let create = foreign "hb_map_create" (void @-> returning (ptr Types.Map.t))

    let del =
      foreign
        "hb_map_del"
        (ptr Types.Map.t @-> Types.Common.codepoint @-> returning void)

    let destroy = foreign "hb_map_destroy" (ptr Types.Map.t @-> returning void)

    let get =
      foreign
        "hb_map_get"
        (ptr Types.Map.t
        @-> Types.Common.codepoint
        @-> returning Types.Common.codepoint)

    let get_empty =
      foreign "hb_map_get_empty" (void @-> returning (ptr Types.Map.t))

    let get_population =
      foreign "hb_map_get_population" (ptr Types.Map.t @-> returning uint)

    let get_user_data =
      foreign
        "hb_map_get_user_data"
        (ptr Types.Map.t
        @-> ptr Types.Common.user_data_key
        @-> returning (ptr void))

    let has =
      foreign
        "hb_map_has"
        (ptr Types.Map.t
        @-> Types.Common.codepoint
        @-> returning Types.Common.bool)

    let is_empty =
      foreign "hb_map_is_empty" (ptr Types.Map.t @-> returning Types.Common.bool)

    let reference =
      foreign
        "hb_map_reference"
        (ptr Types.Map.t @-> returning (ptr Types.Map.t))

    let set =
      foreign
        "hb_map_set"
        (ptr Types.Map.t
        @-> Types.Common.codepoint
        @-> Types.Common.codepoint
        @-> returning void)

    let set_user_data =
      foreign
        "hb_map_set_user_data"
        (ptr Types.Map.t
        @-> ptr Types.Common.user_data_key
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> Types.Common.bool
        @-> returning Types.Common.bool)
  end

  module Set = struct
    let add =
      foreign
        "hb_set_add"
        (ptr Types.Set.t @-> Types.Common.codepoint @-> returning void)

    let add_range =
      foreign
        "hb_set_add_range"
        (ptr Types.Set.t
        @-> Types.Common.codepoint
        @-> Types.Common.codepoint
        @-> returning void)

    let allocation_successful =
      foreign
        "hb_set_allocation_successful"
        (ptr Types.Set.t @-> returning Types.Common.bool)

    let copy =
      foreign "hb_set_copy" (ptr Types.Set.t @-> returning (ptr Types.Set.t))

    let clear = foreign "hb_set_clear" (ptr Types.Set.t @-> returning void)

    let create = foreign "hb_set_create" (void @-> returning (ptr Types.Set.t))

    let del =
      foreign
        "hb_set_del"
        (ptr Types.Set.t @-> Types.Common.codepoint @-> returning void)

    let del_range =
      foreign
        "hb_set_del_range"
        (ptr Types.Set.t
        @-> Types.Common.codepoint
        @-> Types.Common.codepoint
        @-> returning void)

    let destroy = foreign "hb_set_destroy" (ptr Types.Set.t @-> returning void)

    let get_empty =
      foreign "hb_set_get_empty" (void @-> returning (ptr Types.Set.t))

    let get_max =
      foreign
        "hb_set_get_max"
        (ptr Types.Set.t @-> returning Types.Common.codepoint)

    let get_min =
      foreign
        "hb_set_get_min"
        (ptr Types.Set.t @-> returning Types.Common.codepoint)

    let get_population =
      foreign "hb_set_get_population" (ptr Types.Set.t @-> returning uint)

    let get_user_data =
      foreign
        "hb_set_get_user_data"
        (ptr Types.Set.t
        @-> ptr Types.Common.user_data_key
        @-> returning (ptr void))

    let has =
      foreign
        "hb_set_has"
        (ptr Types.Set.t
        @-> Types.Common.codepoint
        @-> returning Types.Common.bool)

    let intersect =
      foreign
        "hb_set_intersect"
        (ptr Types.Set.t @-> ptr Types.Set.t @-> returning void)

    let invert = foreign "hb_set_invert" (ptr Types.Set.t @-> returning void)

    let is_empty =
      foreign "hb_set_is_empty" (ptr Types.Set.t @-> returning Types.Common.bool)

    let is_equal =
      foreign
        "hb_set_is_equal"
        (ptr Types.Set.t @-> ptr Types.Set.t @-> returning Types.Common.bool)

    let is_subset =
      foreign
        "hb_set_is_subset"
        (ptr Types.Set.t @-> ptr Types.Set.t @-> returning Types.Common.bool)

    let next =
      foreign
        "hb_set_next"
        (ptr Types.Set.t
        @-> ptr Types.Common.codepoint
        @-> returning Types.Common.bool)

    let next_range =
      foreign
        "hb_set_next_range"
        (ptr Types.Set.t
        @-> ptr Types.Common.codepoint
        @-> ptr Types.Common.codepoint
        @-> returning Types.Common.bool)

    let previous =
      foreign
        "hb_set_previous"
        (ptr Types.Set.t
        @-> ptr Types.Common.codepoint
        @-> returning Types.Common.bool)

    let previous_range =
      foreign
        "hb_set_previous_range"
        (ptr Types.Set.t
        @-> ptr Types.Common.codepoint
        @-> ptr Types.Common.codepoint
        @-> returning Types.Common.bool)

    let reference =
      foreign
        "hb_set_reference"
        (ptr Types.Set.t @-> returning (ptr Types.Set.t))

    let set =
      foreign
        "hb_set_set"
        (ptr Types.Set.t @-> ptr Types.Set.t @-> returning void)

    let set_user_data =
      foreign
        "hb_set_set_user_data"
        (ptr Types.Set.t
        @-> ptr Types.Common.user_data_key
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> Types.Common.bool
        @-> returning Types.Common.bool)

    let subtract =
      foreign
        "hb_set_subtract"
        (ptr Types.Set.t @-> ptr Types.Set.t @-> returning void)

    let symmetric_difference =
      foreign
        "hb_set_symmetric_difference"
        (ptr Types.Set.t @-> ptr Types.Set.t @-> returning void)

    let union =
      foreign
        "hb_set_union"
        (ptr Types.Set.t @-> ptr Types.Set.t @-> returning void)
  end

  module Shape_plan = struct
    let create =
      foreign
        "hb_shape_plan_create"
        (ptr Types.Face.t
        @-> ptr Types.Buffer.Segment_property.t
        @-> ptr Types.Common.Feature.t
        @-> uint
        @-> ptr string
        @-> returning (ptr Types.Shape_plan.t))

    let create_cached =
      foreign
        "hb_shape_plan_create_cached"
        (ptr Types.Face.t
        @-> ptr Types.Buffer.Segment_property.t
        @-> ptr Types.Common.Feature.t
        @-> uint
        @-> ptr string
        @-> returning (ptr Types.Shape_plan.t))

    let create2 =
      foreign
        "hb_shape_plan_create2"
        (ptr Types.Face.t
        @-> ptr Types.Buffer.Segment_property.t
        @-> ptr Types.Common.Feature.t
        @-> uint
        @-> ptr int
        @-> uint
        @-> ptr string
        @-> returning (ptr Types.Shape_plan.t))

    let create_cached2 =
      foreign
        "hb_shape_plan_create_cached2"
        (ptr Types.Face.t
        @-> ptr Types.Buffer.Segment_property.t
        @-> ptr Types.Common.Feature.t
        @-> uint
        @-> ptr int
        @-> uint
        @-> ptr string
        @-> returning (ptr Types.Shape_plan.t))

    let destroy =
      foreign "hb_shape_plan_destroy" (ptr Types.Shape_plan.t @-> returning void)

    let execute =
      foreign
        "hb_shape_plan_execute"
        (ptr Types.Shape_plan.t
        @-> ptr Types.Font.t
        @-> ptr Types.Buffer.t
        @-> ptr Types.Common.Feature.t
        @-> uint
        @-> returning Types.Common.bool)

    let get_empty =
      foreign
        "hb_shape_plan_get_empty"
        (void @-> returning (ptr Types.Shape_plan.t))

    let get_shaper =
      foreign
        "hb_shape_plan_get_shaper"
        (ptr Types.Shape_plan.t @-> returning string)

    let get_user_data =
      foreign
        "hb_shape_plan_get_user_data"
        (ptr Types.Shape_plan.t
        @-> ptr Types.Common.user_data_key
        @-> returning (ptr void))

    let reference =
      foreign
        "hb_shape_plan_reference"
        (ptr Types.Shape_plan.t @-> returning (ptr Types.Shape_plan.t))

    let set_user_data =
      foreign
        "hb_shape_plan_set_user_data"
        (ptr Types.Shape_plan.t
        @-> ptr Types.Common.user_data_key
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> Types.Common.bool
        @-> returning Types.Common.bool)
  end

  module Shape = struct
    let shape =
      foreign
        "hb_shape"
        (ptr Types.Font.t
        @-> ptr Types.Buffer.t
        @-> ptr Types.Common.Feature.t
        @-> uint
        @-> returning void)

    let shape_full =
      foreign
        "hb_shape_full"
        (ptr Types.Font.t
        @-> ptr Types.Buffer.t
        @-> ptr Types.Common.Feature.t
        @-> uint
        @-> ptr string
        @-> returning Types.Common.bool)

    let list_shapers =
      foreign "hb_shape_list_shapers" (void @-> returning (ptr string))
  end

  module Unicode = struct
    let combining_class =
      foreign
        "hb_unicode_combining_class"
        (ptr Types.Unicode.funcs
        @-> Types.Common.codepoint
        @-> returning Types.Unicode.Combining_class.t)

    let compose =
      foreign
        "hb_unicode_compose"
        (ptr Types.Unicode.funcs
        @-> Types.Common.codepoint
        @-> Types.Common.codepoint
        @-> ptr Types.Common.codepoint
        @-> returning Types.Common.bool)

    let decompose =
      foreign
        "hb_unicode_decompose"
        (ptr Types.Unicode.funcs
        @-> Types.Common.codepoint
        @-> Types.Common.codepoint
        @-> ptr Types.Common.codepoint
        @-> returning Types.Common.bool)

    let funcs_create =
      foreign
        "hb_unicode_funcs_create"
        (ptr Types.Unicode.funcs @-> returning (ptr Types.Unicode.funcs))

    let funcs_destroy =
      foreign
        "hb_unicode_funcs_destroy"
        (ptr Types.Unicode.funcs @-> returning void)

    let funcs_get_default =
      foreign
        "hb_unicode_funcs_get_default"
        (void @-> returning (ptr Types.Unicode.funcs))

    let funcs_get_empty =
      foreign
        "hb_unicode_funcs_get_empty"
        (void @-> returning (ptr Types.Unicode.funcs))

    let funcs_get_parent =
      foreign
        "hb_unicode_funcs_get_parent"
        (ptr Types.Unicode.funcs @-> returning (ptr Types.Unicode.funcs))

    let funcs_get_user_data =
      foreign
        "hb_unicode_funcs_get_user_data"
        (ptr Types.Unicode.funcs
        @-> ptr Types.Common.user_data_key
        @-> returning (ptr void))

    let funcs_is_immutable =
      foreign
        "hb_unicode_funcs_is_immutable"
        (ptr Types.Unicode.funcs @-> returning Types.Common.bool)

    let funcs_make_immutable =
      foreign
        "hb_unicode_funcs_make_immutable"
        (ptr Types.Unicode.funcs @-> returning void)

    let funcs_reference =
      foreign
        "hb_unicode_funcs_reference"
        (ptr Types.Unicode.funcs @-> returning (ptr Types.Unicode.funcs))

    let funcs_set_combining_class_func =
      foreign
        "hb_unicode_funcs_set_combining_class_func"
        (ptr Types.Unicode.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Unicode.funcs
                @-> Types.Common.codepoint
                @-> ptr void
                @-> returning Types.Unicode.Combining_class.t)
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_compose_func =
      foreign
        "hb_unicode_funcs_set_compose_func"
        (ptr Types.Unicode.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Unicode.funcs
                @-> Types.Common.codepoint
                @-> Types.Common.codepoint
                @-> ptr Types.Common.codepoint
                @-> ptr void
                @-> returning Types.Common.bool)
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_decompose_func =
      foreign
        "hb_unicode_funcs_set_decompose_func"
        (ptr Types.Unicode.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Unicode.funcs
                @-> Types.Common.codepoint
                @-> Types.Common.codepoint
                @-> ptr Types.Common.codepoint
                @-> ptr void
                @-> returning Types.Common.bool)
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_general_category_func =
      foreign
        "hb_unicode_funcs_set_general_category_func"
        (ptr Types.Unicode.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Unicode.funcs
                @-> Types.Common.codepoint
                @-> ptr void
                @-> returning Types.Unicode.General_category.t)
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_mirroring_func =
      foreign
        "hb_unicode_funcs_set_mirroring_func"
        (ptr Types.Unicode.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Unicode.funcs
                @-> Types.Common.codepoint
                @-> ptr void
                @-> returning Types.Common.codepoint)
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_script_func =
      foreign
        "hb_unicode_funcs_set_script_func"
        (ptr Types.Unicode.funcs
        @-> static_funptr
              Ctypes.(
                ptr Types.Unicode.funcs
                @-> Types.Common.codepoint
                @-> ptr void
                @-> returning Types.Common.Script.t)
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning void)

    let funcs_set_user_data =
      foreign
        "hb_unicode_funcs_set_user_data"
        (ptr Types.Unicode.funcs
        @-> ptr Types.Common.user_data_key
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> Types.Common.bool
        @-> returning Types.Common.bool)

    let general_category =
      foreign
        "hb_unicode_general_category"
        (ptr Types.Unicode.funcs
        @-> Types.Common.codepoint
        @-> returning Types.Unicode.General_category.t)

    let mirroring =
      foreign
        "hb_unicode_mirroring"
        (ptr Types.Unicode.funcs
        @-> Types.Common.codepoint
        @-> returning Types.Common.codepoint)

    let script =
      foreign
        "hb_unicode_script"
        (ptr Types.Unicode.funcs
        @-> Types.Common.codepoint
        @-> returning Types.Common.Script.t)
  end

  module Version = struct
    let t =
      foreign
        "hb_version"
        (ptr uint @-> ptr uint @-> ptr uint @-> returning void)

    let atleast =
      foreign
        "hb_version_atleast"
        (uint @-> uint @-> uint @-> returning Types.Common.bool)

    let string = foreign "hb_version_string" (void @-> returning string)
  end
end
