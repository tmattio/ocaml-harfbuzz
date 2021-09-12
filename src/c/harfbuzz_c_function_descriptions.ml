module Types = Harfbuzz_c_types

module Descriptions (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F

  module Common = struct
    let tag_from_string =
      foreign
        "hb_tag_from_string"
        (ptr char @-> int @-> returning Types.Common.tag)

    let tag_to_string =
      foreign
        "hb_tag_to_string"
        (Types.Common.tag @-> ptr char @-> returning void)

    let direction_from_string =
      foreign
        "hb_direction_from_string"
        (ptr char @-> int @-> returning Types.Common.Direction.t)

    let direction_to_string =
      foreign
        "hb_direction_to_string"
        (Types.Common.Direction.t @-> returning (ptr char))

    let script_from_iso15924_tag =
      foreign
        "hb_script_from_iso15924_tag"
        (Types.Common.tag @-> returning Types.Common.Script.t)

    let script_from_string =
      foreign
        "hb_script_from_string"
        (ptr char @-> int @-> returning Types.Common.Script.t)

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
        (ptr char @-> int @-> returning Types.Common.language)

    let language_to_string =
      foreign
        "hb_language_to_string"
        (Types.Common.language @-> returning (ptr char))

    let language_get_default =
      foreign
        "hb_language_get_default"
        (void @-> returning Types.Common.language)

    let feature_from_string =
      foreign
        "hb_feature_from_string"
        (ptr char
        @-> int
        @-> ptr Types.Common.Feature.t
        @-> returning Types.Common.bool)

    let feature_to_string =
      foreign
        "hb_feature_to_string"
        (ptr Types.Common.Feature.t @-> ptr char @-> uint @-> returning void)

    let variation_from_string =
      foreign
        "hb_variation_from_string"
        (ptr char
        @-> int
        @-> ptr Types.Common.Variation.t
        @-> returning Types.Common.bool)

    let variation_to_string =
      foreign
        "hb_variation_to_string"
        (ptr Types.Common.Variation.t @-> ptr char @-> uint @-> returning void)
  end

  module Buffer = struct
    let create = foreign "hb_buffer_create" (void @-> returning void)

    let reference = foreign "hb_buffer_reference" (void @-> returning void)

    let get_empty = foreign "hb_buffer_get_empty" (void @-> returning void)

    let destroy = foreign "hb_buffer_destroy" (void @-> returning void)

    let reset = foreign "hb_buffer_reset" (void @-> returning void)

    let clear_contents =
      foreign "hb_buffer_clear_contents" (void @-> returning void)

    let pre_allocate = foreign "hb_buffer_pre_allocate" (void @-> returning void)

    let allocation_successful =
      foreign "hb_buffer_allocation_successful" (void @-> returning void)

    let add = foreign "hb_buffer_add" (void @-> returning void)

    let add_codepoints =
      foreign "hb_buffer_add_codepoints" (void @-> returning void)

    let add_utf32 = foreign "hb_buffer_add_utf32" (void @-> returning void)

    let add_utf16 = foreign "hb_buffer_add_utf16" (void @-> returning void)

    let add_utf8 = foreign "hb_buffer_add_utf8" (void @-> returning void)

    let add_latin1 = foreign "hb_buffer_add_latin1" (void @-> returning void)

    let append = foreign "hb_buffer_append" (void @-> returning void)

    let set_content_type =
      foreign "hb_buffer_set_content_type" (void @-> returning void)

    let get_content_type =
      foreign "hb_buffer_get_content_type" (void @-> returning void)

    let set_direction =
      foreign "hb_buffer_set_direction" (void @-> returning void)

    let get_direction =
      foreign "hb_buffer_get_direction" (void @-> returning void)

    let set_script = foreign "hb_buffer_set_script" (void @-> returning void)

    let get_script = foreign "hb_buffer_get_script" (void @-> returning void)

    let set_language = foreign "hb_buffer_set_language" (void @-> returning void)

    let get_language = foreign "hb_buffer_get_language" (void @-> returning void)

    let set_flags = foreign "hb_buffer_set_flags" (void @-> returning void)

    let get_flags = foreign "hb_buffer_get_flags" (void @-> returning void)

    let set_cluster_level =
      foreign "hb_buffer_set_cluster_level" (void @-> returning void)

    let get_cluster_level =
      foreign "hb_buffer_get_cluster_level" (void @-> returning void)

    let set_length = foreign "hb_buffer_set_length" (void @-> returning void)

    let get_length = foreign "hb_buffer_get_length" (void @-> returning void)

    let set_segment_properties =
      foreign "hb_buffer_set_segment_properties" (void @-> returning void)

    let get_segment_properties =
      foreign "hb_buffer_get_segment_properties" (void @-> returning void)

    let guess_segment_properties =
      foreign "hb_buffer_guess_segment_properties" (void @-> returning void)

    let set_unicode_funcs =
      foreign "hb_buffer_set_unicode_funcs" (void @-> returning void)

    let get_unicode_funcs =
      foreign "hb_buffer_get_unicode_funcs" (void @-> returning void)

    let set_user_data =
      foreign "hb_buffer_set_user_data" (void @-> returning void)

    let get_user_data =
      foreign "hb_buffer_get_user_data" (void @-> returning void)

    let get_glyph_infos =
      foreign "hb_buffer_get_glyph_infos" (void @-> returning void)

    let get_glyph_positions =
      foreign "hb_buffer_get_glyph_positions" (void @-> returning void)

    let has_positions =
      foreign "hb_buffer_has_positions" (void @-> returning void)

    let get_invisible_glyph =
      foreign "hb_buffer_get_invisible_glyph" (void @-> returning void)

    let set_invisible_glyph =
      foreign "hb_buffer_set_invisible_glyph" (void @-> returning void)

    let set_replacement_codepoint =
      foreign "hb_buffer_set_replacement_codepoint" (void @-> returning void)

    let get_replacement_codepoint =
      foreign "hb_buffer_get_replacement_codepoint" (void @-> returning void)

    let normalize_glyphs =
      foreign "hb_buffer_normalize_glyphs" (void @-> returning void)

    let reverse = foreign "hb_buffer_reverse" (void @-> returning void)

    let reverse_range =
      foreign "hb_buffer_reverse_range" (void @-> returning void)

    let reverse_clusters =
      foreign "hb_buffer_reverse_clusters" (void @-> returning void)

    let serialize = foreign "hb_buffer_serialize" (void @-> returning void)

    let serialize_glyphs =
      foreign "hb_buffer_serialize_glyphs" (void @-> returning void)

    let deserialize_glyphs =
      foreign "hb_buffer_deserialize_glyphs" (void @-> returning void)

    let serialize_unicode =
      foreign "hb_buffer_serialize_unicode" (void @-> returning void)

    let deserialize_unicode =
      foreign "hb_buffer_deserialize_unicode" (void @-> returning void)

    let serialize_format_from_string =
      foreign "hb_buffer_serialize_format_from_string" (void @-> returning void)

    let serialize_format_to_string =
      foreign "hb_buffer_serialize_format_to_string" (void @-> returning void)

    let serialize_list_formats =
      foreign "hb_buffer_serialize_list_formats" (void @-> returning void)

    let segment_properties_equal =
      foreign "hb_segment_properties_equal" (void @-> returning void)

    let segment_properties_hash =
      foreign "hb_segment_properties_hash" (void @-> returning void)

    let diff = foreign "hb_buffer_diff" (void @-> returning void)

    let set_message_func =
      foreign "hb_buffer_set_message_func" (void @-> returning void)

    let glyph_info_get_glyph_flags =
      foreign "hb_glyph_info_get_glyph_flags" (void @-> returning void)
  end

  module Blob = struct
    let create =
      foreign
        "hb_blob_create"
        (ptr char
        @-> uint
        @-> Types.Blob.Memory_mode.t
        @-> ptr void
        @-> static_funptr Ctypes.(ptr void @-> returning void)
        @-> returning (ptr Types.Blob.t))

    let create_or_fail =
      foreign "hb_blob_create_or_fail" (void @-> returning void)

    let create_from_file =
      foreign "hb_blob_create_from_file" (void @-> returning void)

    let create_from_file_or_fail =
      foreign "hb_blob_create_from_file_or_fail" (void @-> returning void)

    let create_sub_blob =
      foreign "hb_blob_create_sub_blob" (void @-> returning void)

    let copy_writable_or_fail =
      foreign "hb_blob_copy_writable_or_fail" (void @-> returning void)

    let destroy = foreign "hb_blob_destroy" (void @-> returning void)

    let get_data = foreign "hb_blob_get_data" (void @-> returning void)

    let get_data_writable =
      foreign "hb_blob_get_data_writable" (void @-> returning void)

    let get_empty = foreign "hb_blob_get_empty" (void @-> returning void)

    let get_length = foreign "hb_blob_get_length" (void @-> returning void)

    let get_user_data = foreign "hb_blob_get_user_data" (void @-> returning void)

    let is_immutable = foreign "hb_blob_is_immutable" (void @-> returning void)

    let make_immutable =
      foreign "hb_blob_make_immutable" (void @-> returning void)

    let reference = foreign "hb_blob_reference" (void @-> returning void)

    let set_user_data = foreign "hb_blob_set_user_data" (void @-> returning void)
  end

  module Face = struct
    let count = foreign "hb_face_count" (void @-> returning void)

    let create = foreign "hb_face_create" (void @-> returning void)

    let create_for_tables =
      foreign "hb_face_create_for_tables" (void @-> returning void)

    let destroy = foreign "hb_face_destroy" (void @-> returning void)

    let get_empty = foreign "hb_face_get_empty" (void @-> returning void)

    let get_table_tags =
      foreign "hb_face_get_table_tags" (void @-> returning void)

    let get_glyph_count =
      foreign "hb_face_get_glyph_count" (void @-> returning void)

    let get_index = foreign "hb_face_get_index" (void @-> returning void)

    let get_upem = foreign "hb_face_get_upem" (void @-> returning void)

    let get_user_data = foreign "hb_face_get_user_data" (void @-> returning void)

    let is_immutable = foreign "hb_face_is_immutable" (void @-> returning void)

    let make_immutable =
      foreign "hb_face_make_immutable" (void @-> returning void)

    let reference = foreign "hb_face_reference" (void @-> returning void)

    let reference_blob =
      foreign "hb_face_reference_blob" (void @-> returning void)

    let reference_table =
      foreign "hb_face_reference_table" (void @-> returning void)

    let set_glyph_count =
      foreign "hb_face_set_glyph_count" (void @-> returning void)

    let set_index = foreign "hb_face_set_index" (void @-> returning void)

    let set_upem = foreign "hb_face_set_upem" (void @-> returning void)

    let set_user_data = foreign "hb_face_set_user_data" (void @-> returning void)

    let collect_unicodes =
      foreign "hb_face_collect_unicodes" (void @-> returning void)

    let collect_variation_selectors =
      foreign "hb_face_collect_variation_selectors" (void @-> returning void)

    let collect_variation_unicodes =
      foreign "hb_face_collect_variation_unicodes" (void @-> returning void)

    let builder_create =
      foreign "hb_face_builder_create" (void @-> returning void)

    let builder_add_table =
      foreign "hb_face_builder_add_table" (void @-> returning void)
  end

  module Fonts = struct
    let add_glyph_origin_for_direction =
      foreign "hb_font_add_glyph_origin_for_direction" (void @-> returning void)

    let create = foreign "hb_font_create" (void @-> returning void)

    let create_sub_font =
      foreign "hb_font_create_sub_font" (void @-> returning void)

    let destroy = foreign "hb_font_destroy" (void @-> returning void)

    let funcs_create = foreign "hb_font_funcs_create" (void @-> returning void)

    let funcs_destroy = foreign "hb_font_funcs_destroy" (void @-> returning void)

    let funcs_get_empty =
      foreign "hb_font_funcs_get_empty" (void @-> returning void)

    let funcs_get_user_data =
      foreign "hb_font_funcs_get_user_data" (void @-> returning void)

    let funcs_is_immutable =
      foreign "hb_font_funcs_is_immutable" (void @-> returning void)

    let funcs_make_immutable =
      foreign "hb_font_funcs_make_immutable" (void @-> returning void)

    let funcs_reference =
      foreign "hb_font_funcs_reference" (void @-> returning void)

    let funcs_set_glyph_contour_point_func =
      foreign
        "hb_font_funcs_set_glyph_contour_point_func"
        (void @-> returning void)

    let funcs_set_glyph_extents_func =
      foreign "hb_font_funcs_set_glyph_extents_func" (void @-> returning void)

    let funcs_set_glyph_from_name_func =
      foreign "hb_font_funcs_set_glyph_from_name_func" (void @-> returning void)

    let funcs_set_glyph_h_advance_func =
      foreign "hb_font_funcs_set_glyph_h_advance_func" (void @-> returning void)

    let funcs_set_glyph_h_advances_func =
      foreign "hb_font_funcs_set_glyph_h_advances_func" (void @-> returning void)

    let funcs_set_glyph_h_kerning_func =
      foreign "hb_font_funcs_set_glyph_h_kerning_func" (void @-> returning void)

    let funcs_set_glyph_h_origin_func =
      foreign "hb_font_funcs_set_glyph_h_origin_func" (void @-> returning void)

    let funcs_set_glyph_name_func =
      foreign "hb_font_funcs_set_glyph_name_func" (void @-> returning void)

    let funcs_set_glyph_v_advance_func =
      foreign "hb_font_funcs_set_glyph_v_advance_func" (void @-> returning void)

    let funcs_set_glyph_v_advances_func =
      foreign "hb_font_funcs_set_glyph_v_advances_func" (void @-> returning void)

    let funcs_set_glyph_v_origin_func =
      foreign "hb_font_funcs_set_glyph_v_origin_func" (void @-> returning void)

    let funcs_set_nominal_glyph_func =
      foreign "hb_font_funcs_set_nominal_glyph_func" (void @-> returning void)

    let funcs_set_nominal_glyphs_func =
      foreign "hb_font_funcs_set_nominal_glyphs_func" (void @-> returning void)

    let funcs_set_user_data =
      foreign "hb_font_funcs_set_user_data" (void @-> returning void)

    let funcs_set_variation_glyph_func =
      foreign "hb_font_funcs_set_variation_glyph_func" (void @-> returning void)

    let get_empty = foreign "hb_font_get_empty" (void @-> returning void)

    let get_face = foreign "hb_font_get_face" (void @-> returning void)

    let get_glyph = foreign "hb_font_get_glyph" (void @-> returning void)

    let get_glyph_advance_for_direction =
      foreign "hb_font_get_glyph_advance_for_direction" (void @-> returning void)

    let get_glyph_advance_func_t =
      foreign "hb_font_get_glyph_advance_func_t" (void @-> returning void)

    let get_glyph_advances_for_direction =
      foreign
        "hb_font_get_glyph_advances_for_direction"
        (void @-> returning void)

    let get_glyph_advances_func_t =
      foreign "hb_font_get_glyph_advances_func_t" (void @-> returning void)

    let get_glyph_contour_point =
      foreign "hb_font_get_glyph_contour_point" (void @-> returning void)

    let get_glyph_contour_point_for_origin =
      foreign
        "hb_font_get_glyph_contour_point_for_origin"
        (void @-> returning void)

    let get_glyph_contour_point_func_t =
      foreign "hb_font_get_glyph_contour_point_func_t" (void @-> returning void)

    let get_glyph_extents =
      foreign "hb_font_get_glyph_extents" (void @-> returning void)

    let get_glyph_extents_for_origin =
      foreign "hb_font_get_glyph_extents_for_origin" (void @-> returning void)

    let get_glyph_extents_func_t =
      foreign "hb_font_get_glyph_extents_func_t" (void @-> returning void)

    let get_glyph_from_name =
      foreign "hb_font_get_glyph_from_name" (void @-> returning void)

    let get_glyph_from_name_func_t =
      foreign "hb_font_get_glyph_from_name_func_t" (void @-> returning void)

    let get_glyph_h_advance =
      foreign "hb_font_get_glyph_h_advance" (void @-> returning void)

    let get_glyph_h_advances =
      foreign "hb_font_get_glyph_h_advances" (void @-> returning void)

    let get_glyph_h_kerning =
      foreign "hb_font_get_glyph_h_kerning" (void @-> returning void)

    let get_glyph_h_origin =
      foreign "hb_font_get_glyph_h_origin" (void @-> returning void)

    let get_glyph_kerning_for_direction =
      foreign "hb_font_get_glyph_kerning_for_direction" (void @-> returning void)

    let get_glyph_kerning_func_t =
      foreign "hb_font_get_glyph_kerning_func_t" (void @-> returning void)

    let get_glyph_name =
      foreign "hb_font_get_glyph_name" (void @-> returning void)

    let get_glyph_name_func_t =
      foreign "hb_font_get_glyph_name_func_t" (void @-> returning void)

    let get_glyph_origin_for_direction =
      foreign "hb_font_get_glyph_origin_for_direction" (void @-> returning void)

    let get_glyph_origin_func_t =
      foreign "hb_font_get_glyph_origin_func_t" (void @-> returning void)

    let get_glyph_v_advance =
      foreign "hb_font_get_glyph_v_advance" (void @-> returning void)

    let get_glyph_v_advances =
      foreign "hb_font_get_glyph_v_advances" (void @-> returning void)

    let get_glyph_v_origin =
      foreign "hb_font_get_glyph_v_origin" (void @-> returning void)

    let get_nominal_glyph =
      foreign "hb_font_get_nominal_glyph" (void @-> returning void)

    let get_nominal_glyph_func_t =
      foreign "hb_font_get_nominal_glyph_func_t" (void @-> returning void)

    let get_nominal_glyphs =
      foreign "hb_font_get_nominal_glyphs" (void @-> returning void)

    let get_parent = foreign "hb_font_get_parent" (void @-> returning void)

    let get_ppem = foreign "hb_font_get_ppem" (void @-> returning void)

    let get_ptem = foreign "hb_font_get_ptem" (void @-> returning void)

    let get_scale = foreign "hb_font_get_scale" (void @-> returning void)

    let get_user_data = foreign "hb_font_get_user_data" (void @-> returning void)

    let get_variation_glyph =
      foreign "hb_font_get_variation_glyph" (void @-> returning void)

    let get_variation_glyph_func_t =
      foreign "hb_font_get_variation_glyph_func_t" (void @-> returning void)

    let get_var_coords_normalized =
      foreign "hb_font_get_var_coords_normalized" (void @-> returning void)

    let glyph_from_string =
      foreign "hb_font_glyph_from_string" (void @-> returning void)

    let glyph_to_string =
      foreign "hb_font_glyph_to_string" (void @-> returning void)

    let is_immutable = foreign "hb_font_is_immutable" (void @-> returning void)

    let make_immutable =
      foreign "hb_font_make_immutable" (void @-> returning void)

    let reference = foreign "hb_font_reference" (void @-> returning void)

    let set_face = foreign "hb_font_set_face" (void @-> returning void)

    let set_funcs = foreign "hb_font_set_funcs" (void @-> returning void)

    let set_funcs_data =
      foreign "hb_font_set_funcs_data" (void @-> returning void)

    let set_parent = foreign "hb_font_set_parent" (void @-> returning void)

    let set_ppem = foreign "hb_font_set_ppem" (void @-> returning void)

    let set_ptem = foreign "hb_font_set_ptem" (void @-> returning void)

    let set_scale = foreign "hb_font_set_scale" (void @-> returning void)

    let set_user_data = foreign "hb_font_set_user_data" (void @-> returning void)

    let set_variations =
      foreign "hb_font_set_variations" (void @-> returning void)

    let set_var_coords_design =
      foreign "hb_font_set_var_coords_design" (void @-> returning void)

    let set_var_coords_normalized =
      foreign "hb_font_set_var_coords_normalized" (void @-> returning void)

    let set_var_named_instance =
      foreign "hb_font_set_var_named_instance" (void @-> returning void)

    let subtract_glyph_origin_for_direction =
      foreign
        "hb_font_subtract_glyph_origin_for_direction"
        (void @-> returning void)

    let reference_table_func_t =
      foreign "hb_reference_table_func_t" (void @-> returning void)

    let funcs_set_font_h_extents_func =
      foreign "hb_font_funcs_set_font_h_extents_func" (void @-> returning void)

    let funcs_set_font_v_extents_func =
      foreign "hb_font_funcs_set_font_v_extents_func" (void @-> returning void)

    let get_extents_for_direction =
      foreign "hb_font_get_extents_for_direction" (void @-> returning void)

    let get_font_extents_func_t =
      foreign "hb_font_get_font_extents_func_t" (void @-> returning void)

    let get_h_extents = foreign "hb_font_get_h_extents" (void @-> returning void)

    let get_v_extents = foreign "hb_font_get_v_extents" (void @-> returning void)
  end

  module Map = struct
    let allocation_successful =
      foreign "hb_map_allocation_successful" (void @-> returning void)

    let clear = foreign "hb_map_clear" (void @-> returning void)

    let create = foreign "hb_map_create" (void @-> returning void)

    let del = foreign "hb_map_del" (void @-> returning void)

    let destroy = foreign "hb_map_destroy" (void @-> returning void)

    let get = foreign "hb_map_get" (void @-> returning void)

    let get_empty = foreign "hb_map_get_empty" (void @-> returning void)

    let get_population =
      foreign "hb_map_get_population" (void @-> returning void)

    let get_user_data = foreign "hb_map_get_user_data" (void @-> returning void)

    let has = foreign "hb_map_has" (void @-> returning void)

    let is_empty = foreign "hb_map_is_empty" (void @-> returning void)

    let reference = foreign "hb_map_reference" (void @-> returning void)

    let set = foreign "hb_map_set" (void @-> returning void)

    let set_user_data = foreign "hb_map_set_user_data" (void @-> returning void)
  end

  module Set = struct
    let add = foreign "hb_set_add" (void @-> returning void)

    let add_range = foreign "hb_set_add_range" (void @-> returning void)

    let allocation_successful =
      foreign "hb_set_allocation_successful" (void @-> returning void)

    let copy = foreign "hb_set_copy" (void @-> returning void)

    let clear = foreign "hb_set_clear" (void @-> returning void)

    let create = foreign "hb_set_create" (void @-> returning void)

    let del = foreign "hb_set_del" (void @-> returning void)

    let del_range = foreign "hb_set_del_range" (void @-> returning void)

    let destroy = foreign "hb_set_destroy" (void @-> returning void)

    let get_empty = foreign "hb_set_get_empty" (void @-> returning void)

    let get_max = foreign "hb_set_get_max" (void @-> returning void)

    let get_min = foreign "hb_set_get_min" (void @-> returning void)

    let get_population =
      foreign "hb_set_get_population" (void @-> returning void)

    let get_user_data = foreign "hb_set_get_user_data" (void @-> returning void)

    let has = foreign "hb_set_has" (void @-> returning void)

    let intersect = foreign "hb_set_intersect" (void @-> returning void)

    let invert = foreign "hb_set_invert" (void @-> returning void)

    let is_empty = foreign "hb_set_is_empty" (void @-> returning void)

    let is_equal = foreign "hb_set_is_equal" (void @-> returning void)

    let is_subset = foreign "hb_set_is_subset" (void @-> returning void)

    let next = foreign "hb_set_next" (void @-> returning void)

    let next_range = foreign "hb_set_next_range" (void @-> returning void)

    let previous = foreign "hb_set_previous" (void @-> returning void)

    let previous_range =
      foreign "hb_set_previous_range" (void @-> returning void)

    let reference = foreign "hb_set_reference" (void @-> returning void)

    let set = foreign "hb_set_set" (void @-> returning void)

    let set_user_data = foreign "hb_set_set_user_data" (void @-> returning void)

    let subtract = foreign "hb_set_subtract" (void @-> returning void)

    let symmetric_difference =
      foreign "hb_set_symmetric_difference" (void @-> returning void)

    let union = foreign "hb_set_union" (void @-> returning void)
  end

  module Shape_plan = struct
    let create = foreign "hb_shape_plan_create" (void @-> returning void)

    let create_cached =
      foreign "hb_shape_plan_create_cached" (void @-> returning void)

    let create2 = foreign "hb_shape_plan_create2" (void @-> returning void)

    let create_cached2 =
      foreign "hb_shape_plan_create_cached2" (void @-> returning void)

    let destroy = foreign "hb_shape_plan_destroy" (void @-> returning void)

    let execute = foreign "hb_shape_plan_execute" (void @-> returning void)

    let get_empty = foreign "hb_shape_plan_get_empty" (void @-> returning void)

    let get_shaper = foreign "hb_shape_plan_get_shaper" (void @-> returning void)

    let get_user_data =
      foreign "hb_shape_plan_get_user_data" (void @-> returning void)

    let reference = foreign "hb_shape_plan_reference" (void @-> returning void)

    let set_user_data =
      foreign "hb_shape_plan_set_user_data" (void @-> returning void)
  end

  module Shape = struct
    let shape = foreign "hb_shape" (void @-> returning void)

    let shape_full = foreign "hb_shape_full" (void @-> returning void)

    let list_shapers = foreign "hb_shape_list_shapers" (void @-> returning void)
  end

  module Unicode = struct
    let combining_class =
      foreign "hb_unicode_combining_class" (void @-> returning void)

    let combining_class_func_t =
      foreign "hb_unicode_combining_class_func_t" (void @-> returning void)

    let compose = foreign "hb_unicode_compose" (void @-> returning void)

    let compose_func_t =
      foreign "hb_unicode_compose_func_t" (void @-> returning void)

    let decompose = foreign "hb_unicode_decompose" (void @-> returning void)

    let decompose_func_t =
      foreign "hb_unicode_decompose_func_t" (void @-> returning void)

    let funcs_create =
      foreign "hb_unicode_funcs_create" (void @-> returning void)

    let funcs_destroy =
      foreign "hb_unicode_funcs_destroy" (void @-> returning void)

    let funcs_get_default =
      foreign "hb_unicode_funcs_get_default" (void @-> returning void)

    let funcs_get_empty =
      foreign "hb_unicode_funcs_get_empty" (void @-> returning void)

    let funcs_get_parent =
      foreign "hb_unicode_funcs_get_parent" (void @-> returning void)

    let funcs_get_user_data =
      foreign "hb_unicode_funcs_get_user_data" (void @-> returning void)

    let funcs_is_immutable =
      foreign "hb_unicode_funcs_is_immutable" (void @-> returning void)

    let funcs_make_immutable =
      foreign "hb_unicode_funcs_make_immutable" (void @-> returning void)

    let funcs_reference =
      foreign "hb_unicode_funcs_reference" (void @-> returning void)

    let funcs_set_combining_class_func =
      foreign
        "hb_unicode_funcs_set_combining_class_func"
        (void @-> returning void)

    let funcs_set_compose_func =
      foreign "hb_unicode_funcs_set_compose_func" (void @-> returning void)

    let funcs_set_decompose_func =
      foreign "hb_unicode_funcs_set_decompose_func" (void @-> returning void)

    let funcs_set_general_category_func =
      foreign
        "hb_unicode_funcs_set_general_category_func"
        (void @-> returning void)

    let funcs_set_mirroring_func =
      foreign "hb_unicode_funcs_set_mirroring_func" (void @-> returning void)

    let funcs_set_script_func =
      foreign "hb_unicode_funcs_set_script_func" (void @-> returning void)

    let funcs_set_user_data =
      foreign "hb_unicode_funcs_set_user_data" (void @-> returning void)

    let general_category =
      foreign "hb_unicode_general_category" (void @-> returning void)

    let general_category_func_t =
      foreign "hb_unicode_general_category_func_t" (void @-> returning void)

    let mirroring = foreign "hb_unicode_mirroring" (void @-> returning void)

    let mirroring_func_t =
      foreign "hb_unicode_mirroring_func_t" (void @-> returning void)

    let script = foreign "hb_unicode_script" (void @-> returning void)

    let script_func_t =
      foreign "hb_unicode_script_func_t" (void @-> returning void)
  end

  module Version = struct
    let hb_version = foreign "hb_version" (void @-> returning void)

    let hb_version_atleast =
      foreign "hb_version_atleast" (void @-> returning void)

    let hb_version_string = foreign "hb_version_string" (void @-> returning void)
  end
end
