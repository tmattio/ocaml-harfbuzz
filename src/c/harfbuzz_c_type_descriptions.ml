module Descriptions (F : Ctypes.TYPE) = struct
  open Ctypes
  open F

  module Common = struct
    type bool = [ `Bool ] structure

    let bool : bool typ = typedef (structure "`Bool") "hb_bool_t"

    let () = seal bool

    type codepoint = [ `Codepoint ] structure

    let codepoint : codepoint typ =
      typedef (structure "`Codepoint") "hb_codepoint_t"

    let () = seal codepoint

    module Direction = struct
      let invalid = constant "HB_DIRECTION_INVALID" int64_t

      let ltr = constant "HB_DIRECTION_LTR" int64_t

      let rtl = constant "HB_DIRECTION_RTL" int64_t

      let ttb = constant "HB_DIRECTION_TTB" int64_t

      let btt = constant "HB_DIRECTION_BTT" int64_t

      type t =
        [ `INVALID
        | `LTR
        | `RTL
        | `TTB
        | `BTT
        ]

      let t : t typ =
        enum
          "hb_direction_t"
          ~typedef:true
          [ `INVALID, invalid; `LTR, ltr; `RTL, rtl; `TTB, ttb; `BTT, btt ]
    end

    type language = [ `Language ] structure

    let language : language typ =
      typedef (structure "`Language") "hb_language_t"

    let () = seal language

    type tag = [ `Tag ] structure

    let tag : tag typ = typedef (structure "`Tag") "hb_tag_t"

    let () = seal tag

    module Feature = struct
      type t = [ `Feature ] structure

      let t : t typ = typedef (structure "`Feature") "hb_feature_t"

      let tag = field t "tag" tag

      let value = field t "value" uint32_t

      let start = field t "start" uint

      let end_ = field t "end" uint
    end

    module Variation = struct
      type t = [ `Variation ] structure

      let t : t typ = typedef (structure "`Variation") "hb_variation_t"

      let tag = field t "tag" tag

      let value = field t "value" float
    end

    type mask = [ `Mask ] structure

    let mask : mask typ = typedef (structure "`Mask") "hb_mask_t"

    type position = [ `Position ] structure

    let position : position typ =
      typedef (structure "`Position") "hb_position_t"

    let () = seal position

    module Script = struct
      let common = constant "HB_SCRIPT_COMMON" int64_t

      let inherited = constant "HB_SCRIPT_INHERITED" int64_t

      let unknown = constant "HB_SCRIPT_UNKNOWN" int64_t

      let arabic = constant "HB_SCRIPT_ARABIC" int64_t

      let armenian = constant "HB_SCRIPT_ARMENIAN" int64_t

      let bengali = constant "HB_SCRIPT_BENGALI" int64_t

      let cyrillic = constant "HB_SCRIPT_CYRILLIC" int64_t

      let devanagari = constant "HB_SCRIPT_DEVANAGARI" int64_t

      let georgian = constant "HB_SCRIPT_GEORGIAN" int64_t

      let greek = constant "HB_SCRIPT_GREEK" int64_t

      let gujarati = constant "HB_SCRIPT_GUJARATI" int64_t

      let gurmukhi = constant "HB_SCRIPT_GURMUKHI" int64_t

      let hangul = constant "HB_SCRIPT_HANGUL" int64_t

      let han = constant "HB_SCRIPT_HAN" int64_t

      let hebrew = constant "HB_SCRIPT_HEBREW" int64_t

      let hiragana = constant "HB_SCRIPT_HIRAGANA" int64_t

      let kannada = constant "HB_SCRIPT_KANNADA" int64_t

      let katakana = constant "HB_SCRIPT_KATAKANA" int64_t

      let lao = constant "HB_SCRIPT_LAO" int64_t

      let latin = constant "HB_SCRIPT_LATIN" int64_t

      let malayalam = constant "HB_SCRIPT_MALAYALAM" int64_t

      let oriya = constant "HB_SCRIPT_ORIYA" int64_t

      let tamil = constant "HB_SCRIPT_TAMIL" int64_t

      let telugu = constant "HB_SCRIPT_TELUGU" int64_t

      let thai = constant "HB_SCRIPT_THAI" int64_t

      let tibetan = constant "HB_SCRIPT_TIBETAN" int64_t

      let bopomofo = constant "HB_SCRIPT_BOPOMOFO" int64_t

      let braille = constant "HB_SCRIPT_BRAILLE" int64_t

      let canadian_syllabics = constant "HB_SCRIPT_CANADIAN_SYLLABICS" int64_t

      let cherokee = constant "HB_SCRIPT_CHEROKEE" int64_t

      let ethiopic = constant "HB_SCRIPT_ETHIOPIC" int64_t

      let khmer = constant "HB_SCRIPT_KHMER" int64_t

      let mongolian = constant "HB_SCRIPT_MONGOLIAN" int64_t

      let myanmar = constant "HB_SCRIPT_MYANMAR" int64_t

      let ogham = constant "HB_SCRIPT_OGHAM" int64_t

      let runic = constant "HB_SCRIPT_RUNIC" int64_t

      let sinhala = constant "HB_SCRIPT_SINHALA" int64_t

      let syriac = constant "HB_SCRIPT_SYRIAC" int64_t

      let thaana = constant "HB_SCRIPT_THAANA" int64_t

      let yi = constant "HB_SCRIPT_YI" int64_t

      let deseret = constant "HB_SCRIPT_DESERET" int64_t

      let gothic = constant "HB_SCRIPT_GOTHIC" int64_t

      let old_italic = constant "HB_SCRIPT_OLD_ITALIC" int64_t

      let buhid = constant "HB_SCRIPT_BUHID" int64_t

      let hanunoo = constant "HB_SCRIPT_HANUNOO" int64_t

      let tagalog = constant "HB_SCRIPT_TAGALOG" int64_t

      let tagbanwa = constant "HB_SCRIPT_TAGBANWA" int64_t

      let cypriot = constant "HB_SCRIPT_CYPRIOT" int64_t

      let limbu = constant "HB_SCRIPT_LIMBU" int64_t

      let linear_b = constant "HB_SCRIPT_LINEAR_B" int64_t

      let osmanya = constant "HB_SCRIPT_OSMANYA" int64_t

      let shavian = constant "HB_SCRIPT_SHAVIAN" int64_t

      let tai_le = constant "HB_SCRIPT_TAI_LE" int64_t

      let ugaritic = constant "HB_SCRIPT_UGARITIC" int64_t

      let buginese = constant "HB_SCRIPT_BUGINESE" int64_t

      let coptic = constant "HB_SCRIPT_COPTIC" int64_t

      let glagolitic = constant "HB_SCRIPT_GLAGOLITIC" int64_t

      let kharoshthi = constant "HB_SCRIPT_KHAROSHTHI" int64_t

      let new_tai_lue = constant "HB_SCRIPT_NEW_TAI_LUE" int64_t

      let old_persian = constant "HB_SCRIPT_OLD_PERSIAN" int64_t

      let syloti_nagri = constant "HB_SCRIPT_SYLOTI_NAGRI" int64_t

      let tifinagh = constant "HB_SCRIPT_TIFINAGH" int64_t

      let balinese = constant "HB_SCRIPT_BALINESE" int64_t

      let cuneiform = constant "HB_SCRIPT_CUNEIFORM" int64_t

      let nko = constant "HB_SCRIPT_NKO" int64_t

      let phags_pa = constant "HB_SCRIPT_PHAGS_PA" int64_t

      let phoenician = constant "HB_SCRIPT_PHOENICIAN" int64_t

      let carian = constant "HB_SCRIPT_CARIAN" int64_t

      let cham = constant "HB_SCRIPT_CHAM" int64_t

      let kayah_li = constant "HB_SCRIPT_KAYAH_LI" int64_t

      let lepcha = constant "HB_SCRIPT_LEPCHA" int64_t

      let lycian = constant "HB_SCRIPT_LYCIAN" int64_t

      let lydian = constant "HB_SCRIPT_LYDIAN" int64_t

      let ol_chiki = constant "HB_SCRIPT_OL_CHIKI" int64_t

      let rejang = constant "HB_SCRIPT_REJANG" int64_t

      let saurashtra = constant "HB_SCRIPT_SAURASHTRA" int64_t

      let sundanese = constant "HB_SCRIPT_SUNDANESE" int64_t

      let vai = constant "HB_SCRIPT_VAI" int64_t

      let avestan = constant "HB_SCRIPT_AVESTAN" int64_t

      let bamum = constant "HB_SCRIPT_BAMUM" int64_t

      let egyptian_hieroglyphs =
        constant "HB_SCRIPT_EGYPTIAN_HIEROGLYPHS" int64_t

      let imperial_aramaic = constant "HB_SCRIPT_IMPERIAL_ARAMAIC" int64_t

      let inscriptional_pahlavi =
        constant "HB_SCRIPT_INSCRIPTIONAL_PAHLAVI" int64_t

      let inscriptional_parthian =
        constant "HB_SCRIPT_INSCRIPTIONAL_PARTHIAN" int64_t

      let javanese = constant "HB_SCRIPT_JAVANESE" int64_t

      let kaithi = constant "HB_SCRIPT_KAITHI" int64_t

      let lisu = constant "HB_SCRIPT_LISU" int64_t

      let meetei_mayek = constant "HB_SCRIPT_MEETEI_MAYEK" int64_t

      let old_south_arabian = constant "HB_SCRIPT_OLD_SOUTH_ARABIAN" int64_t

      let old_turkic = constant "HB_SCRIPT_OLD_TURKIC" int64_t

      let samaritan = constant "HB_SCRIPT_SAMARITAN" int64_t

      let tai_tham = constant "HB_SCRIPT_TAI_THAM" int64_t

      let tai_viet = constant "HB_SCRIPT_TAI_VIET" int64_t

      let batak = constant "HB_SCRIPT_BATAK" int64_t

      let brahmi = constant "HB_SCRIPT_BRAHMI" int64_t

      let mandaic = constant "HB_SCRIPT_MANDAIC" int64_t

      let chakma = constant "HB_SCRIPT_CHAKMA" int64_t

      let meroitic_cursive = constant "HB_SCRIPT_MEROITIC_CURSIVE" int64_t

      let meroitic_hieroglyphs =
        constant "HB_SCRIPT_MEROITIC_HIEROGLYPHS" int64_t

      let miao = constant "HB_SCRIPT_MIAO" int64_t

      let sharada = constant "HB_SCRIPT_SHARADA" int64_t

      let sora_sompeng = constant "HB_SCRIPT_SORA_SOMPENG" int64_t

      let takri = constant "HB_SCRIPT_TAKRI" int64_t

      let bassa_vah = constant "HB_SCRIPT_BASSA_VAH" int64_t

      let caucasian_albanian = constant "HB_SCRIPT_CAUCASIAN_ALBANIAN" int64_t

      let duployan = constant "HB_SCRIPT_DUPLOYAN" int64_t

      let elbasan = constant "HB_SCRIPT_ELBASAN" int64_t

      let grantha = constant "HB_SCRIPT_GRANTHA" int64_t

      let khojki = constant "HB_SCRIPT_KHOJKI" int64_t

      let khudawadi = constant "HB_SCRIPT_KHUDAWADI" int64_t

      let linear_a = constant "HB_SCRIPT_LINEAR_A" int64_t

      let mahajani = constant "HB_SCRIPT_MAHAJANI" int64_t

      let manichaean = constant "HB_SCRIPT_MANICHAEAN" int64_t

      let mende_kikakui = constant "HB_SCRIPT_MENDE_KIKAKUI" int64_t

      let modi = constant "HB_SCRIPT_MODI" int64_t

      let mro = constant "HB_SCRIPT_MRO" int64_t

      let nabataean = constant "HB_SCRIPT_NABATAEAN" int64_t

      let old_north_arabian = constant "HB_SCRIPT_OLD_NORTH_ARABIAN" int64_t

      let old_permic = constant "HB_SCRIPT_OLD_PERMIC" int64_t

      let pahawh_hmong = constant "HB_SCRIPT_PAHAWH_HMONG" int64_t

      let palmyrene = constant "HB_SCRIPT_PALMYRENE" int64_t

      let pau_cin_hau = constant "HB_SCRIPT_PAU_CIN_HAU" int64_t

      let psalter_pahlavi = constant "HB_SCRIPT_PSALTER_PAHLAVI" int64_t

      let siddham = constant "HB_SCRIPT_SIDDHAM" int64_t

      let tirhuta = constant "HB_SCRIPT_TIRHUTA" int64_t

      let warang_citi = constant "HB_SCRIPT_WARANG_CITI" int64_t

      let ahom = constant "HB_SCRIPT_AHOM" int64_t

      let anatolian_hieroglyphs =
        constant "HB_SCRIPT_ANATOLIAN_HIEROGLYPHS" int64_t

      let hatran = constant "HB_SCRIPT_HATRAN" int64_t

      let multani = constant "HB_SCRIPT_MULTANI" int64_t

      let old_hungarian = constant "HB_SCRIPT_OLD_HUNGARIAN" int64_t

      let signwriting = constant "HB_SCRIPT_SIGNWRITING" int64_t

      let adlam = constant "HB_SCRIPT_ADLAM" int64_t

      let bhaiksuki = constant "HB_SCRIPT_BHAIKSUKI" int64_t

      let marchen = constant "HB_SCRIPT_MARCHEN" int64_t

      let osage = constant "HB_SCRIPT_OSAGE" int64_t

      let tangut = constant "HB_SCRIPT_TANGUT" int64_t

      let newa = constant "HB_SCRIPT_NEWA" int64_t

      let masaram_gondi = constant "HB_SCRIPT_MASARAM_GONDI" int64_t

      let nushu = constant "HB_SCRIPT_NUSHU" int64_t

      let soyombo = constant "HB_SCRIPT_SOYOMBO" int64_t

      let zanabazar_square = constant "HB_SCRIPT_ZANABAZAR_SQUARE" int64_t

      let dogra = constant "HB_SCRIPT_DOGRA" int64_t

      let gunjala_gondi = constant "HB_SCRIPT_GUNJALA_GONDI" int64_t

      let hanifi_rohingya = constant "HB_SCRIPT_HANIFI_ROHINGYA" int64_t

      let makasar = constant "HB_SCRIPT_MAKASAR" int64_t

      let medefaidrin = constant "HB_SCRIPT_MEDEFAIDRIN" int64_t

      let old_sogdian = constant "HB_SCRIPT_OLD_SOGDIAN" int64_t

      let sogdian = constant "HB_SCRIPT_SOGDIAN" int64_t

      let elymaic = constant "HB_SCRIPT_ELYMAIC" int64_t

      let nandinagari = constant "HB_SCRIPT_NANDINAGARI" int64_t

      let nyiakeng_puachue_hmong =
        constant "HB_SCRIPT_NYIAKENG_PUACHUE_HMONG" int64_t

      let wancho = constant "HB_SCRIPT_WANCHO" int64_t

      let chorasmian = constant "HB_SCRIPT_CHORASMIAN" int64_t

      let dives_akuru = constant "HB_SCRIPT_DIVES_AKURU" int64_t

      let khitan_small_script = constant "HB_SCRIPT_KHITAN_SMALL_SCRIPT" int64_t

      let yezidi = constant "HB_SCRIPT_YEZIDI" int64_t

      let invalid = constant "HB_SCRIPT_INVALID" int64_t

      type t =
        [ `COMMON
        | `INHERITED
        | `UNKNOWN
        | `ARABIC
        | `ARMENIAN
        | `BENGALI
        | `CYRILLIC
        | `DEVANAGARI
        | `GEORGIAN
        | `GREEK
        | `GUJARATI
        | `GURMUKHI
        | `HANGUL
        | `HAN
        | `HEBREW
        | `HIRAGANA
        | `KANNADA
        | `KATAKANA
        | `LAO
        | `LATIN
        | `MALAYALAM
        | `ORIYA
        | `TAMIL
        | `TELUGU
        | `THAI
        | `TIBETAN
        | `BOPOMOFO
        | `BRAILLE
        | `CANADIAN_SYLLABICS
        | `CHEROKEE
        | `ETHIOPIC
        | `KHMER
        | `MONGOLIAN
        | `MYANMAR
        | `OGHAM
        | `RUNIC
        | `SINHALA
        | `SYRIAC
        | `THAANA
        | `YI
        | `DESERET
        | `GOTHIC
        | `OLD_ITALIC
        | `BUHID
        | `HANUNOO
        | `TAGALOG
        | `TAGBANWA
        | `CYPRIOT
        | `LIMBU
        | `LINEAR_B
        | `OSMANYA
        | `SHAVIAN
        | `TAI_LE
        | `UGARITIC
        | `BUGINESE
        | `COPTIC
        | `GLAGOLITIC
        | `KHAROSHTHI
        | `NEW_TAI_LUE
        | `OLD_PERSIAN
        | `SYLOTI_NAGRI
        | `TIFINAGH
        | `BALINESE
        | `CUNEIFORM
        | `NKO
        | `PHAGS_PA
        | `PHOENICIAN
        | `CARIAN
        | `CHAM
        | `KAYAH_LI
        | `LEPCHA
        | `LYCIAN
        | `LYDIAN
        | `OL_CHIKI
        | `REJANG
        | `SAURASHTRA
        | `SUNDANESE
        | `VAI
        | `AVESTAN
        | `BAMUM
        | `EGYPTIAN_HIEROGLYPHS
        | `IMPERIAL_ARAMAIC
        | `INSCRIPTIONAL_PAHLAVI
        | `INSCRIPTIONAL_PARTHIAN
        | `JAVANESE
        | `KAITHI
        | `LISU
        | `MEETEI_MAYEK
        | `OLD_SOUTH_ARABIAN
        | `OLD_TURKIC
        | `SAMARITAN
        | `TAI_THAM
        | `TAI_VIET
        | `BATAK
        | `BRAHMI
        | `MANDAIC
        | `CHAKMA
        | `MEROITIC_CURSIVE
        | `MEROITIC_HIEROGLYPHS
        | `MIAO
        | `SHARADA
        | `SORA_SOMPENG
        | `TAKRI
        | `BASSA_VAH
        | `CAUCASIAN_ALBANIAN
        | `DUPLOYAN
        | `ELBASAN
        | `GRANTHA
        | `KHOJKI
        | `KHUDAWADI
        | `LINEAR_A
        | `MAHAJANI
        | `MANICHAEAN
        | `MENDE_KIKAKUI
        | `MODI
        | `MRO
        | `NABATAEAN
        | `OLD_NORTH_ARABIAN
        | `OLD_PERMIC
        | `PAHAWH_HMONG
        | `PALMYRENE
        | `PAU_CIN_HAU
        | `PSALTER_PAHLAVI
        | `SIDDHAM
        | `TIRHUTA
        | `WARANG_CITI
        | `AHOM
        | `ANATOLIAN_HIEROGLYPHS
        | `HATRAN
        | `MULTANI
        | `OLD_HUNGARIAN
        | `SIGNWRITING
        | `ADLAM
        | `BHAIKSUKI
        | `MARCHEN
        | `OSAGE
        | `TANGUT
        | `NEWA
        | `MASARAM_GONDI
        | `NUSHU
        | `SOYOMBO
        | `ZANABAZAR_SQUARE
        | `DOGRA
        | `GUNJALA_GONDI
        | `HANIFI_ROHINGYA
        | `MAKASAR
        | `MEDEFAIDRIN
        | `OLD_SOGDIAN
        | `SOGDIAN
        | `ELYMAIC
        | `NANDINAGARI
        | `NYIAKENG_PUACHUE_HMONG
        | `WANCHO
        | `CHORASMIAN
        | `DIVES_AKURU
        | `KHITAN_SMALL_SCRIPT
        | `YEZIDI
        | `INVALID
        ]

      let t : t typ =
        enum
          "hb_script_t"
          ~typedef:true
          ~unexpected:(fun _ -> `UNKNOWN)
          [ `COMMON, common
          ; `INHERITED, inherited
          ; `UNKNOWN, unknown
          ; `ARABIC, arabic
          ; `ARMENIAN, armenian
          ; `BENGALI, bengali
          ; `CYRILLIC, cyrillic
          ; `DEVANAGARI, devanagari
          ; `GEORGIAN, georgian
          ; `GREEK, greek
          ; `GUJARATI, gujarati
          ; `GURMUKHI, gurmukhi
          ; `HANGUL, hangul
          ; `HAN, han
          ; `HEBREW, hebrew
          ; `HIRAGANA, hiragana
          ; `KANNADA, kannada
          ; `KATAKANA, katakana
          ; `LAO, lao
          ; `LATIN, latin
          ; `MALAYALAM, malayalam
          ; `ORIYA, oriya
          ; `TAMIL, tamil
          ; `TELUGU, telugu
          ; `THAI, thai
          ; `TIBETAN, tibetan
          ; `BOPOMOFO, bopomofo
          ; `BRAILLE, braille
          ; `CANADIAN_SYLLABICS, canadian_syllabics
          ; `CHEROKEE, cherokee
          ; `ETHIOPIC, ethiopic
          ; `KHMER, khmer
          ; `MONGOLIAN, mongolian
          ; `MYANMAR, myanmar
          ; `OGHAM, ogham
          ; `RUNIC, runic
          ; `SINHALA, sinhala
          ; `SYRIAC, syriac
          ; `THAANA, thaana
          ; `YI, yi
          ; `DESERET, deseret
          ; `GOTHIC, gothic
          ; `OLD_ITALIC, old_italic
          ; `BUHID, buhid
          ; `HANUNOO, hanunoo
          ; `TAGALOG, tagalog
          ; `TAGBANWA, tagbanwa
          ; `CYPRIOT, cypriot
          ; `LIMBU, limbu
          ; `LINEAR_B, linear_b
          ; `OSMANYA, osmanya
          ; `SHAVIAN, shavian
          ; `TAI_LE, tai_le
          ; `UGARITIC, ugaritic
          ; `BUGINESE, buginese
          ; `COPTIC, coptic
          ; `GLAGOLITIC, glagolitic
          ; `KHAROSHTHI, kharoshthi
          ; `NEW_TAI_LUE, new_tai_lue
          ; `OLD_PERSIAN, old_persian
          ; `SYLOTI_NAGRI, syloti_nagri
          ; `TIFINAGH, tifinagh
          ; `BALINESE, balinese
          ; `CUNEIFORM, cuneiform
          ; `NKO, nko
          ; `PHAGS_PA, phags_pa
          ; `PHOENICIAN, phoenician
          ; `CARIAN, carian
          ; `CHAM, cham
          ; `KAYAH_LI, kayah_li
          ; `LEPCHA, lepcha
          ; `LYCIAN, lycian
          ; `LYDIAN, lydian
          ; `OL_CHIKI, ol_chiki
          ; `REJANG, rejang
          ; `SAURASHTRA, saurashtra
          ; `SUNDANESE, sundanese
          ; `VAI, vai
          ; `AVESTAN, avestan
          ; `BAMUM, bamum
          ; `EGYPTIAN_HIEROGLYPHS, egyptian_hieroglyphs
          ; `IMPERIAL_ARAMAIC, imperial_aramaic
          ; `INSCRIPTIONAL_PAHLAVI, inscriptional_pahlavi
          ; `INSCRIPTIONAL_PARTHIAN, inscriptional_parthian
          ; `JAVANESE, javanese
          ; `KAITHI, kaithi
          ; `LISU, lisu
          ; `MEETEI_MAYEK, meetei_mayek
          ; `OLD_SOUTH_ARABIAN, old_south_arabian
          ; `OLD_TURKIC, old_turkic
          ; `SAMARITAN, samaritan
          ; `TAI_THAM, tai_tham
          ; `TAI_VIET, tai_viet
          ; `BATAK, batak
          ; `BRAHMI, brahmi
          ; `MANDAIC, mandaic
          ; `CHAKMA, chakma
          ; `MEROITIC_CURSIVE, meroitic_cursive
          ; `MEROITIC_HIEROGLYPHS, meroitic_hieroglyphs
          ; `MIAO, miao
          ; `SHARADA, sharada
          ; `SORA_SOMPENG, sora_sompeng
          ; `TAKRI, takri
          ; `BASSA_VAH, bassa_vah
          ; `CAUCASIAN_ALBANIAN, caucasian_albanian
          ; `DUPLOYAN, duployan
          ; `ELBASAN, elbasan
          ; `GRANTHA, grantha
          ; `KHOJKI, khojki
          ; `KHUDAWADI, khudawadi
          ; `LINEAR_A, linear_a
          ; `MAHAJANI, mahajani
          ; `MANICHAEAN, manichaean
          ; `MENDE_KIKAKUI, mende_kikakui
          ; `MODI, modi
          ; `MRO, mro
          ; `NABATAEAN, nabataean
          ; `OLD_NORTH_ARABIAN, old_north_arabian
          ; `OLD_PERMIC, old_permic
          ; `PAHAWH_HMONG, pahawh_hmong
          ; `PALMYRENE, palmyrene
          ; `PAU_CIN_HAU, pau_cin_hau
          ; `PSALTER_PAHLAVI, psalter_pahlavi
          ; `SIDDHAM, siddham
          ; `TIRHUTA, tirhuta
          ; `WARANG_CITI, warang_citi
          ; `AHOM, ahom
          ; `ANATOLIAN_HIEROGLYPHS, anatolian_hieroglyphs
          ; `HATRAN, hatran
          ; `MULTANI, multani
          ; `OLD_HUNGARIAN, old_hungarian
          ; `SIGNWRITING, signwriting
          ; `ADLAM, adlam
          ; `BHAIKSUKI, bhaiksuki
          ; `MARCHEN, marchen
          ; `OSAGE, osage
          ; `TANGUT, tangut
          ; `NEWA, newa
          ; `MASARAM_GONDI, masaram_gondi
          ; `NUSHU, nushu
          ; `SOYOMBO, soyombo
          ; `ZANABAZAR_SQUARE, zanabazar_square
          ; `DOGRA, dogra
          ; `GUNJALA_GONDI, gunjala_gondi
          ; `HANIFI_ROHINGYA, hanifi_rohingya
          ; `MAKASAR, makasar
          ; `MEDEFAIDRIN, medefaidrin
          ; `OLD_SOGDIAN, old_sogdian
          ; `SOGDIAN, sogdian
          ; `ELYMAIC, elymaic
          ; `NANDINAGARI, nandinagari
          ; `NYIAKENG_PUACHUE_HMONG, nyiakeng_puachue_hmong
          ; `WANCHO, wancho
          ; `CHORASMIAN, chorasmian
          ; `DIVES_AKURU, dives_akuru
          ; `KHITAN_SMALL_SCRIPT, khitan_small_script
          ; `YEZIDI, yezidi
          ; `INVALID, invalid
          ]
    end

    type user_data_key = [ `User_data_key ] structure

    let user_data_key : user_data_key typ =
      typedef (structure "`User_data_key") "hb_user_data_key_t"

    (* let tag_none = constant "HB_TAG_NONE" tag *)

    (* let tag_max = constant "HB_TAG_MAX" tag *)

    (* let tag_max_signed = constant "HB_TAG_MAX_SIGNED" tag *)

    (* let language_invalid = constant "HB_LANGUAGE_INVALID" language *)

    let feature_global_end = constant "HB_FEATURE_GLOBAL_END" uint

    let feature_global_start = constant "HB_FEATURE_GLOBAL_START" uint
  end

  module Blob = struct
    type t = [ `Blob ] structure

    let t : t typ = typedef (structure "`Blob") "hb_blob_t"

    module Memory_mode = struct
      let duplicate = constant "HB_MEMORY_MODE_DUPLICATE" int64_t

      let readonly = constant "HB_MEMORY_MODE_READONLY" int64_t

      let writable = constant "HB_MEMORY_MODE_WRITABLE" int64_t

      let readonly_may_make_writable =
        constant "HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE" int64_t

      type t =
        [ `DUPLICATE
        | `READONLY
        | `WRITABLE
        | `READONLY_MAY_MAKE_WRITABLE
        ]

      let t : t typ =
        enum
          "hb_memory_mode_t"
          ~typedef:true
          [ `DUPLICATE, duplicate
          ; `READONLY, readonly
          ; `WRITABLE, writable
          ; `READONLY_MAY_MAKE_WRITABLE, readonly_may_make_writable
          ]
    end
  end

  module Buffer = struct
    type t = [ `Buffer ] structure

    let t : t typ = typedef (structure "`Buffer") "hb_buffer_t"

    module Glyph_info = struct
      type t = [ `Glyph_info ] structure

      let t : t typ = typedef (structure "`Glyph_info") "hb_glyph_info_t"

      let codepoint = field t "codepoint" Common.codepoint

      let cluster = field t "cluster" uint32_t
    end

    module Glyph_flags = struct
      type t =
        [ `UNSAFE_TO_BREAK
        | `DEFINED
        ]

      let unsafe_to_break = constant "HB_GLYPH_FLAG_UNSAFE_TO_BREAK" int64_t

      let defined = constant "HB_GLYPH_FLAG_DEFINED" int64_t

      let t : t typ =
        enum
          "hb_glyph_flags_t"
          ~typedef:true
          [ `UNSAFE_TO_BREAK, unsafe_to_break; `DEFINED, defined ]
    end

    module Glyph_position = struct
      type t = [ `Glyph_position ] structure

      let t : t typ =
        typedef (structure "`Glyph_position") "hb_glyph_position_t"

      let x_advance = field t "x_advance" Common.position

      let y_advance = field t "y_advance" Common.position

      let x_offset = field t "x_offset" Common.position

      let y_offset = field t "y_offset" Common.position
    end

    module Content_type = struct
      type t =
        [ `INVALID
        | `UNICODE
        | `GLYPHS
        ]

      let invalid = constant "HB_BUFFER_CONTENT_TYPE_INVALID" int64_t

      let unicode = constant "HB_BUFFER_CONTENT_TYPE_UNICODE" int64_t

      let glyphs = constant "HB_BUFFER_CONTENT_TYPE_GLYPHS" int64_t

      let t : t typ =
        enum
          "hb_buffer_content_type_t"
          ~typedef:true
          [ `INVALID, invalid; `UNICODE, unicode; `GLYPHS, glyphs ]
    end

    module Flags = struct
      type t =
        [ `DEFAULT
        | `BOT
        | `EOT
        | `PRESERVE_DEFAULT_IGNORABLES
        | `REMOVE_DEFAULT_IGNORABLES
        | `DO_NOT_INSERT_DOTTED_CIRCLE
        ]

      let default = constant "HB_BUFFER_FLAG_DEFAULT" int64_t

      let bot = constant "HB_BUFFER_FLAG_BOT" int64_t

      let eot = constant "HB_BUFFER_FLAG_EOT" int64_t

      let preserve_default_ignorables =
        constant "HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES" int64_t

      let remove_default_ignorables =
        constant "HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES" int64_t

      let do_not_insert_dotted_circle =
        constant "HB_BUFFER_FLAG_DO_NOT_INSERT_DOTTED_CIRCLE" int64_t

      let t : t typ =
        enum
          "hb_buffer_flags_t"
          ~typedef:true
          [ `DEFAULT, default
          ; `BOT, bot
          ; `EOT, eot
          ; `PRESERVE_DEFAULT_IGNORABLES, preserve_default_ignorables
          ; `REMOVE_DEFAULT_IGNORABLES, remove_default_ignorables
          ; `DO_NOT_INSERT_DOTTED_CIRCLE, do_not_insert_dotted_circle
          ]
    end

    module Cluster_level = struct
      type t =
        [ `MONOTONE_GRAPHEMES
        | `MONOTONE_CHARACTERS
        | `CHARACTERS
        | `DEFAULT
        ]

      let monotone_graphemes =
        constant "HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES" int64_t

      let monotone_characters =
        constant "HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS" int64_t

      let characters = constant "HB_BUFFER_CLUSTER_LEVEL_CHARACTERS" int64_t

      let default = constant "HB_BUFFER_CLUSTER_LEVEL_DEFAULT" int64_t

      let t : t typ =
        enum
          "hb_buffer_cluster_level_t"
          ~typedef:true
          [ `MONOTONE_GRAPHEMES, monotone_graphemes
          ; `MONOTONE_CHARACTERS, monotone_characters
          ; `CHARACTERS, characters
          ; `DEFAULT, default
          ]
    end

    module Segment_property = struct
      type t = [ `Segment_property ] structure

      let t : t typ =
        typedef (structure "`Segment_property") "hb_segment_properties_t"

      let () = seal t

      let direction = field t "direction" Common.Direction.t

      let script = field t "script" Common.Script.t

      let language = field t "language" Common.language
    end

    module Serialize_format = struct
      type t =
        [ `TEXT
        | `JSON
        | `INVALID
        ]

      let text = constant "HB_BUFFER_SERIALIZE_FORMAT_TEXT" int64_t

      let json = constant "HB_BUFFER_SERIALIZE_FORMAT_JSON" int64_t

      let invalid = constant "HB_BUFFER_SERIALIZE_FORMAT_INVALID" int64_t

      let t : t typ =
        enum
          "hb_buffer_serialize_format_t"
          ~typedef:true
          [ `TEXT, text; `JSON, json; `INVALID, invalid ]
    end

    module Serialize_flags = struct
      type t =
        [ `DEFAULT
        | `NO_CLUSTERS
        | `NO_POSITIONS
        | `NO_GLYPH_NAMES
        | `GLYPH_EXTENTS
        | `GLYPH_FLAGS
        | `NO_ADVANCES
        ]

      let default = constant "HB_BUFFER_SERIALIZE_FLAG_DEFAULT" int64_t

      let no_clusters = constant "HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS" int64_t

      let no_positions =
        constant "HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS" int64_t

      let no_glyph_names =
        constant "HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES" int64_t

      let glyph_extents =
        constant "HB_BUFFER_SERIALIZE_FLAG_GLYPH_EXTENTS" int64_t

      let glyph_flags = constant "HB_BUFFER_SERIALIZE_FLAG_GLYPH_FLAGS" int64_t

      let no_advances = constant "HB_BUFFER_SERIALIZE_FLAG_NO_ADVANCES" int64_t

      let t : t typ =
        enum
          "hb_buffer_serialize_flags_t"
          ~typedef:true
          [ `DEFAULT, default
          ; `NO_CLUSTERS, no_clusters
          ; `NO_POSITIONS, no_positions
          ; `NO_GLYPH_NAMES, no_glyph_names
          ; `GLYPH_EXTENTS, glyph_extents
          ; `GLYPH_FLAGS, glyph_flags
          ; `NO_ADVANCES, no_advances
          ]
    end

    module Diff_flags = struct
      type t =
        [ `EQUAL
        | `CONTENT_TYPE_MISMATCH
        | `LENGTH_MISMATCH
        | `NOTDEF_PRESENT
        | `DOTTED_CIRCLE_PRESENT
        | `CODEPOINT_MISMATCH
        | `CLUSTER_MISMATCH
        | `GLYPH_FLAGS_MISMATCH
        | `POSITION_MISMATCH
        ]

      let equal = constant "HB_BUFFER_DIFF_FLAG_EQUAL" int64_t

      let content_type_mismatch =
        constant "HB_BUFFER_DIFF_FLAG_CONTENT_TYPE_MISMATCH" int64_t

      let length_mismatch =
        constant "HB_BUFFER_DIFF_FLAG_LENGTH_MISMATCH" int64_t

      let notdef_present = constant "HB_BUFFER_DIFF_FLAG_NOTDEF_PRESENT" int64_t

      let dotted_circle_present =
        constant "HB_BUFFER_DIFF_FLAG_DOTTED_CIRCLE_PRESENT" int64_t

      let codepoint_mismatch =
        constant "HB_BUFFER_DIFF_FLAG_CODEPOINT_MISMATCH" int64_t

      let cluster_mismatch =
        constant "HB_BUFFER_DIFF_FLAG_CLUSTER_MISMATCH" int64_t

      let glyph_flags_mismatch =
        constant "HB_BUFFER_DIFF_FLAG_GLYPH_FLAGS_MISMATCH" int64_t

      let position_mismatch =
        constant "HB_BUFFER_DIFF_FLAG_POSITION_MISMATCH" int64_t

      let t : t typ =
        enum
          "hb_buffer_diff_flags_t"
          ~typedef:true
          [ `EQUAL, equal
          ; `CONTENT_TYPE_MISMATCH, content_type_mismatch
          ; `LENGTH_MISMATCH, length_mismatch
          ; `NOTDEF_PRESENT, notdef_present
          ; `DOTTED_CIRCLE_PRESENT, dotted_circle_present
          ; `CODEPOINT_MISMATCH, codepoint_mismatch
          ; `CLUSTER_MISMATCH, cluster_mismatch
          ; `GLYPH_FLAGS_MISMATCH, glyph_flags_mismatch
          ; `POSITION_MISMATCH, position_mismatch
          ]
    end

    (* let segment_properties_default = constant "HB_SEGMENT_PROPERTIES_DEFAULT"
       Segment_property.t *)

    let buffer_replacement_codepoint_default =
      constant "HB_BUFFER_REPLACEMENT_CODEPOINT_DEFAULT" int
  end

  module Face = struct
    type t = [ `Face ] structure

    let t : t typ = typedef (structure "`Face") "hb_face_t"
  end

  module Font = struct
    type t = [ `Font ] structure

    let t : t typ = typedef (structure "`Font") "hb_font_t"

    type funcs = [ `Funcs ] structure

    let funcs : funcs typ = typedef (structure "`Funcs") "hb_font_funcs_t"

    type get_glyph_h_advance_func = [ `Get_glyph_h_advance_func ] structure

    let get_glyph_h_advance_func : get_glyph_h_advance_func typ =
      typedef
        (structure "`Get_glyph_h_advance_func")
        "hb_font_get_glyph_h_advance_func_t"

    let () = seal get_glyph_h_advance_func

    type get_glyph_h_advances_func = [ `Get_glyph_h_advances_func ] structure

    let get_glyph_h_advances_func : get_glyph_h_advances_func typ =
      typedef
        (structure "`Get_glyph_h_advances_func")
        "hb_font_get_glyph_h_advances_func_t"

    let () = seal get_glyph_h_advances_func

    type get_glyph_h_kerning_func = [ `Get_glyph_h_kerning_func ] structure

    let get_glyph_h_kerning_func : get_glyph_h_kerning_func typ =
      typedef
        (structure "`Get_glyph_h_kerning_func")
        "hb_font_get_glyph_h_kerning_func_t"

    let () = seal get_glyph_h_kerning_func

    type get_glyph_h_origin_func = [ `Get_glyph_h_origin_func ] structure

    let get_glyph_h_origin_func : get_glyph_h_origin_func typ =
      typedef
        (structure "`Get_glyph_h_origin_func")
        "hb_font_get_glyph_h_origin_func_t"

    let () = seal get_glyph_h_origin_func

    type get_glyph_v_advance_func = [ `Get_glyph_v_advance_func ] structure

    let get_glyph_v_advance_func : get_glyph_v_advance_func typ =
      typedef
        (structure "`Get_glyph_v_advance_func")
        "hb_font_get_glyph_v_advance_func_t"

    let () = seal get_glyph_v_advance_func

    type get_glyph_v_advances_func = [ `Get_glyph_v_advances_func ] structure

    let get_glyph_v_advances_func : get_glyph_v_advances_func typ =
      typedef
        (structure "`Get_glyph_v_advances_func")
        "hb_font_get_glyph_v_advances_func_t"

    let () = seal get_glyph_v_advances_func

    type get_glyph_v_origin_func = [ `Get_glyph_v_origin_func ] structure

    let get_glyph_v_origin_func : get_glyph_v_origin_func typ =
      typedef
        (structure "`Get_glyph_v_origin_func")
        "hb_font_get_glyph_v_origin_func_t"

    let () = seal get_glyph_v_origin_func

    type get_font_h_extents_func = [ `Get_font_h_extents_func ] structure

    let get_font_h_extents_func : get_font_h_extents_func typ =
      typedef
        (structure "`Get_font_h_extents_func")
        "hb_font_get_font_h_extents_func_t"

    let () = seal get_font_h_extents_func

    type get_font_v_extents_func = [ `Get_font_v_extents_func ] structure

    let get_font_v_extents_func : get_font_v_extents_func typ =
      typedef
        (structure "`Get_font_v_extents_func")
        "hb_font_get_font_v_extents_func_t"

    let () = seal get_font_v_extents_func

    module Extents = struct
      type t = [ `Extents ] structure

      let t : t typ = typedef (structure "`Extents") "hb_font_extents_t"

      let ascender = field t "ascender" Common.position

      let descender = field t "descender" Common.position

      let line_gap = field t "line_gap" Common.position
    end

    module Glyph_extents = struct
      type t = [ `Glyph_extents ] structure

      let t : t typ = typedef (structure "`Glyph_extents") "hb_glyph_extents_t"

      let x_bearing = field t "x_bearing" Common.position

      let y_bearing = field t "y_bearing" Common.position

      let width = field t "width" Common.position

      let height = field t "height" Common.position
    end
  end

  module Map = struct
    type t = [ `Map ] structure

    let t : t typ = typedef (structure "`Map") "hb_map_t"

    (* let value_invalid = constant "HB_MAP_VALUE_INVALID" t *)
  end

  module Set = struct
    type t = [ `Set ] structure

    let t : t typ = typedef (structure "`Set") "hb_set_t"

    (* let value_invalid = constant "HB_SET_VALUE_INVALID" t *)
  end

  module Shape_plan = struct
    type t = [ `Shape_plan ] structure

    let t : t typ = typedef (structure "`Shape_plan") "hb_shape_plan_t"
  end

  module Unicode = struct
    type funcs = [ `Unicode_funcs ] structure

    let funcs : funcs typ =
      typedef (structure "`Unicode_funcs") "hb_unicode_funcs_t"

    module Combining_class = struct
      type t =
        [ `NOT_REORDERED
        | `OVERLAY
        | `NUKTA
        | `KANA_VOICING
        | `VIRAMA
        | `CCC10
        | `CCC11
        | `CCC12
        | `CCC13
        | `CCC14
        | `CCC15
        | `CCC16
        | `CCC17
        | `CCC18
        | `CCC19
        | `CCC20
        | `CCC21
        | `CCC22
        | `CCC23
        | `CCC24
        | `CCC25
        | `CCC26
        | `CCC27
        | `CCC28
        | `CCC29
        | `CCC30
        | `CCC31
        | `CCC32
        | `CCC33
        | `CCC34
        | `CCC35
        | `CCC36
        | `CCC84
        | `CCC91
        | `CCC103
        | `CCC107
        | `CCC118
        | `CCC122
        | `CCC129
        | `CCC130
        | `CCC133
        | `ATTACHED_BELOW_LEFT
        | `ATTACHED_BELOW
        | `ATTACHED_ABOVE
        | `ATTACHED_ABOVE_RIGHT
        | `BELOW_LEFT
        | `BELOW
        | `BELOW_RIGHT
        | `LEFT
        | `RIGHT
        | `ABOVE_LEFT
        | `ABOVE
        | `ABOVE_RIGHT
        | `DOUBLE_BELOW
        | `DOUBLE_ABOVE
        | `IOTA_SUBSCRIPT
        | `INVALID
        ]

      let not_reordered =
        constant "HB_UNICODE_COMBINING_CLASS_NOT_REORDERED" int64_t

      let overlay = constant "HB_UNICODE_COMBINING_CLASS_OVERLAY" int64_t

      let nukta = constant "HB_UNICODE_COMBINING_CLASS_NUKTA" int64_t

      let kana_voicing =
        constant "HB_UNICODE_COMBINING_CLASS_KANA_VOICING" int64_t

      let virama = constant "HB_UNICODE_COMBINING_CLASS_VIRAMA" int64_t

      let ccc10 = constant "HB_UNICODE_COMBINING_CLASS_CCC10" int64_t

      let ccc11 = constant "HB_UNICODE_COMBINING_CLASS_CCC11" int64_t

      let ccc12 = constant "HB_UNICODE_COMBINING_CLASS_CCC12" int64_t

      let ccc13 = constant "HB_UNICODE_COMBINING_CLASS_CCC13" int64_t

      let ccc14 = constant "HB_UNICODE_COMBINING_CLASS_CCC14" int64_t

      let ccc15 = constant "HB_UNICODE_COMBINING_CLASS_CCC15" int64_t

      let ccc16 = constant "HB_UNICODE_COMBINING_CLASS_CCC16" int64_t

      let ccc17 = constant "HB_UNICODE_COMBINING_CLASS_CCC17" int64_t

      let ccc18 = constant "HB_UNICODE_COMBINING_CLASS_CCC18" int64_t

      let ccc19 = constant "HB_UNICODE_COMBINING_CLASS_CCC19" int64_t

      let ccc20 = constant "HB_UNICODE_COMBINING_CLASS_CCC20" int64_t

      let ccc21 = constant "HB_UNICODE_COMBINING_CLASS_CCC21" int64_t

      let ccc22 = constant "HB_UNICODE_COMBINING_CLASS_CCC22" int64_t

      let ccc23 = constant "HB_UNICODE_COMBINING_CLASS_CCC23" int64_t

      let ccc24 = constant "HB_UNICODE_COMBINING_CLASS_CCC24" int64_t

      let ccc25 = constant "HB_UNICODE_COMBINING_CLASS_CCC25" int64_t

      let ccc26 = constant "HB_UNICODE_COMBINING_CLASS_CCC26" int64_t

      let ccc27 = constant "HB_UNICODE_COMBINING_CLASS_CCC27" int64_t

      let ccc28 = constant "HB_UNICODE_COMBINING_CLASS_CCC28" int64_t

      let ccc29 = constant "HB_UNICODE_COMBINING_CLASS_CCC29" int64_t

      let ccc30 = constant "HB_UNICODE_COMBINING_CLASS_CCC30" int64_t

      let ccc31 = constant "HB_UNICODE_COMBINING_CLASS_CCC31" int64_t

      let ccc32 = constant "HB_UNICODE_COMBINING_CLASS_CCC32" int64_t

      let ccc33 = constant "HB_UNICODE_COMBINING_CLASS_CCC33" int64_t

      let ccc34 = constant "HB_UNICODE_COMBINING_CLASS_CCC34" int64_t

      let ccc35 = constant "HB_UNICODE_COMBINING_CLASS_CCC35" int64_t

      let ccc36 = constant "HB_UNICODE_COMBINING_CLASS_CCC36" int64_t

      let ccc84 = constant "HB_UNICODE_COMBINING_CLASS_CCC84" int64_t

      let ccc91 = constant "HB_UNICODE_COMBINING_CLASS_CCC91" int64_t

      let ccc103 = constant "HB_UNICODE_COMBINING_CLASS_CCC103" int64_t

      let ccc107 = constant "HB_UNICODE_COMBINING_CLASS_CCC107" int64_t

      let ccc118 = constant "HB_UNICODE_COMBINING_CLASS_CCC118" int64_t

      let ccc122 = constant "HB_UNICODE_COMBINING_CLASS_CCC122" int64_t

      let ccc129 = constant "HB_UNICODE_COMBINING_CLASS_CCC129" int64_t

      let ccc130 = constant "HB_UNICODE_COMBINING_CLASS_CCC130" int64_t

      let ccc133 = constant "HB_UNICODE_COMBINING_CLASS_CCC133" int64_t

      let attached_below_left =
        constant "HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW_LEFT" int64_t

      let attached_below =
        constant "HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW" int64_t

      let attached_above =
        constant "HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE" int64_t

      let attached_above_right =
        constant "HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE_RIGHT" int64_t

      let below_left = constant "HB_UNICODE_COMBINING_CLASS_BELOW_LEFT" int64_t

      let below = constant "HB_UNICODE_COMBINING_CLASS_BELOW" int64_t

      let below_right =
        constant "HB_UNICODE_COMBINING_CLASS_BELOW_RIGHT" int64_t

      let left = constant "HB_UNICODE_COMBINING_CLASS_LEFT" int64_t

      let right = constant "HB_UNICODE_COMBINING_CLASS_RIGHT" int64_t

      let above_left = constant "HB_UNICODE_COMBINING_CLASS_ABOVE_LEFT" int64_t

      let above = constant "HB_UNICODE_COMBINING_CLASS_ABOVE" int64_t

      let above_right =
        constant "HB_UNICODE_COMBINING_CLASS_ABOVE_RIGHT" int64_t

      let double_below =
        constant "HB_UNICODE_COMBINING_CLASS_DOUBLE_BELOW" int64_t

      let double_above =
        constant "HB_UNICODE_COMBINING_CLASS_DOUBLE_ABOVE" int64_t

      let iota_subscript =
        constant "HB_UNICODE_COMBINING_CLASS_IOTA_SUBSCRIPT" int64_t

      let invalid = constant "HB_UNICODE_COMBINING_CLASS_INVALID" int64_t

      let t : t typ =
        enum
          "hb_unicode_combining_class_t"
          ~typedef:true
          [ `NOT_REORDERED, not_reordered
          ; `OVERLAY, overlay
          ; `NUKTA, nukta
          ; `KANA_VOICING, kana_voicing
          ; `VIRAMA, virama
          ; `CCC10, ccc10
          ; `CCC11, ccc11
          ; `CCC12, ccc12
          ; `CCC13, ccc13
          ; `CCC14, ccc14
          ; `CCC15, ccc15
          ; `CCC16, ccc16
          ; `CCC17, ccc17
          ; `CCC18, ccc18
          ; `CCC19, ccc19
          ; `CCC20, ccc20
          ; `CCC21, ccc21
          ; `CCC22, ccc22
          ; `CCC23, ccc23
          ; `CCC24, ccc24
          ; `CCC25, ccc25
          ; `CCC26, ccc26
          ; `CCC27, ccc27
          ; `CCC28, ccc28
          ; `CCC29, ccc29
          ; `CCC30, ccc30
          ; `CCC31, ccc31
          ; `CCC32, ccc32
          ; `CCC33, ccc33
          ; `CCC34, ccc34
          ; `CCC35, ccc35
          ; `CCC36, ccc36
          ; `CCC84, ccc84
          ; `CCC91, ccc91
          ; `CCC103, ccc103
          ; `CCC107, ccc107
          ; `CCC118, ccc118
          ; `CCC122, ccc122
          ; `CCC129, ccc129
          ; `CCC130, ccc130
          ; `CCC133, ccc133
          ; `ATTACHED_BELOW_LEFT, attached_below_left
          ; `ATTACHED_BELOW, attached_below
          ; `ATTACHED_ABOVE, attached_above
          ; `ATTACHED_ABOVE_RIGHT, attached_above_right
          ; `BELOW_LEFT, below_left
          ; `BELOW, below
          ; `BELOW_RIGHT, below_right
          ; `LEFT, left
          ; `RIGHT, right
          ; `ABOVE_LEFT, above_left
          ; `ABOVE, above
          ; `ABOVE_RIGHT, above_right
          ; `DOUBLE_BELOW, double_below
          ; `DOUBLE_ABOVE, double_above
          ; `IOTA_SUBSCRIPT, iota_subscript
          ; `INVALID, invalid
          ]
    end

    module General_category = struct
      type t =
        [ `CONTROL
        | `FORMAT
        | `UNASSIGNED
        | `PRIVATE_USE
        | `SURROGATE
        | `LOWERCASE_LETTER
        | `MODIFIER_LETTER
        | `OTHER_LETTER
        | `TITLECASE_LETTER
        | `UPPERCASE_LETTER
        | `SPACING_MARK
        | `ENCLOSING_MARK
        | `NON_SPACING_MARK
        | `DECIMAL_NUMBER
        | `LETTER_NUMBER
        | `OTHER_NUMBER
        | `CONNECT_PUNCTUATION
        | `DASH_PUNCTUATION
        | `CLOSE_PUNCTUATION
        | `FINAL_PUNCTUATION
        | `INITIAL_PUNCTUATION
        | `OTHER_PUNCTUATION
        | `OPEN_PUNCTUATION
        | `CURRENCY_SYMBOL
        | `MODIFIER_SYMBOL
        | `MATH_SYMBOL
        | `OTHER_SYMBOL
        | `LINE_SEPARATOR
        | `PARAGRAPH_SEPARATOR
        | `SPACE_SEPARATOR
        ]

      let control = constant "HB_UNICODE_GENERAL_CATEGORY_CONTROL" int64_t

      let format = constant "HB_UNICODE_GENERAL_CATEGORY_FORMAT" int64_t

      let unassigned = constant "HB_UNICODE_GENERAL_CATEGORY_UNASSIGNED" int64_t

      let private_use =
        constant "HB_UNICODE_GENERAL_CATEGORY_PRIVATE_USE" int64_t

      let surrogate = constant "HB_UNICODE_GENERAL_CATEGORY_SURROGATE" int64_t

      let lowercase_letter =
        constant "HB_UNICODE_GENERAL_CATEGORY_LOWERCASE_LETTER" int64_t

      let modifier_letter =
        constant "HB_UNICODE_GENERAL_CATEGORY_MODIFIER_LETTER" int64_t

      let other_letter =
        constant "HB_UNICODE_GENERAL_CATEGORY_OTHER_LETTER" int64_t

      let titlecase_letter =
        constant "HB_UNICODE_GENERAL_CATEGORY_TITLECASE_LETTER" int64_t

      let uppercase_letter =
        constant "HB_UNICODE_GENERAL_CATEGORY_UPPERCASE_LETTER" int64_t

      let spacing_mark =
        constant "HB_UNICODE_GENERAL_CATEGORY_SPACING_MARK" int64_t

      let enclosing_mark =
        constant "HB_UNICODE_GENERAL_CATEGORY_ENCLOSING_MARK" int64_t

      let non_spacing_mark =
        constant "HB_UNICODE_GENERAL_CATEGORY_NON_SPACING_MARK" int64_t

      let decimal_number =
        constant "HB_UNICODE_GENERAL_CATEGORY_DECIMAL_NUMBER" int64_t

      let letter_number =
        constant "HB_UNICODE_GENERAL_CATEGORY_LETTER_NUMBER" int64_t

      let other_number =
        constant "HB_UNICODE_GENERAL_CATEGORY_OTHER_NUMBER" int64_t

      let connect_punctuation =
        constant "HB_UNICODE_GENERAL_CATEGORY_CONNECT_PUNCTUATION" int64_t

      let dash_punctuation =
        constant "HB_UNICODE_GENERAL_CATEGORY_DASH_PUNCTUATION" int64_t

      let close_punctuation =
        constant "HB_UNICODE_GENERAL_CATEGORY_CLOSE_PUNCTUATION" int64_t

      let final_punctuation =
        constant "HB_UNICODE_GENERAL_CATEGORY_FINAL_PUNCTUATION" int64_t

      let initial_punctuation =
        constant "HB_UNICODE_GENERAL_CATEGORY_INITIAL_PUNCTUATION" int64_t

      let other_punctuation =
        constant "HB_UNICODE_GENERAL_CATEGORY_OTHER_PUNCTUATION" int64_t

      let open_punctuation =
        constant "HB_UNICODE_GENERAL_CATEGORY_OPEN_PUNCTUATION" int64_t

      let currency_symbol =
        constant "HB_UNICODE_GENERAL_CATEGORY_CURRENCY_SYMBOL" int64_t

      let modifier_symbol =
        constant "HB_UNICODE_GENERAL_CATEGORY_MODIFIER_SYMBOL" int64_t

      let math_symbol =
        constant "HB_UNICODE_GENERAL_CATEGORY_MATH_SYMBOL" int64_t

      let other_symbol =
        constant "HB_UNICODE_GENERAL_CATEGORY_OTHER_SYMBOL" int64_t

      let line_separator =
        constant "HB_UNICODE_GENERAL_CATEGORY_LINE_SEPARATOR" int64_t

      let paragraph_separator =
        constant "HB_UNICODE_GENERAL_CATEGORY_PARAGRAPH_SEPARATOR" int64_t

      let space_separator =
        constant "HB_UNICODE_GENERAL_CATEGORY_SPACE_SEPARATOR" int64_t

      let t : t typ =
        enum
          "hb_unicode_general_category_t"
          ~typedef:true
          [ `CONTROL, control
          ; `FORMAT, format
          ; `UNASSIGNED, unassigned
          ; `PRIVATE_USE, private_use
          ; `SURROGATE, surrogate
          ; `LOWERCASE_LETTER, lowercase_letter
          ; `MODIFIER_LETTER, modifier_letter
          ; `OTHER_LETTER, other_letter
          ; `TITLECASE_LETTER, titlecase_letter
          ; `UPPERCASE_LETTER, uppercase_letter
          ; `SPACING_MARK, spacing_mark
          ; `ENCLOSING_MARK, enclosing_mark
          ; `NON_SPACING_MARK, non_spacing_mark
          ; `DECIMAL_NUMBER, decimal_number
          ; `LETTER_NUMBER, letter_number
          ; `OTHER_NUMBER, other_number
          ; `CONNECT_PUNCTUATION, connect_punctuation
          ; `DASH_PUNCTUATION, dash_punctuation
          ; `CLOSE_PUNCTUATION, close_punctuation
          ; `FINAL_PUNCTUATION, final_punctuation
          ; `INITIAL_PUNCTUATION, initial_punctuation
          ; `OTHER_PUNCTUATION, other_punctuation
          ; `OPEN_PUNCTUATION, open_punctuation
          ; `CURRENCY_SYMBOL, currency_symbol
          ; `MODIFIER_SYMBOL, modifier_symbol
          ; `MATH_SYMBOL, math_symbol
          ; `OTHER_SYMBOL, other_symbol
          ; `LINE_SEPARATOR, line_separator
          ; `PARAGRAPH_SEPARATOR, paragraph_separator
          ; `SPACE_SEPARATOR, space_separator
          ]
    end
  end

  module Version = struct
    let major = constant "HB_VERSION_MAJOR" int

    let micro = constant "HB_VERSION_MICRO" int

    let minor = constant "HB_VERSION_MINOR" int

    (* let string = constant "HB_VERSION_STRING" string *)
    (* Cannot be bound as a constant. See C.Functions.Version.string *)
  end
end
