(lang dune 2.0)

(name harfbuzz)

(documentation "https://tmattio.github.io/harfbuzz/")

(source
 (github tmattio/harfbuzz))

(license ISC)

(authors "Thibaut Mattio")

(maintainers "Thibaut Mattio")

(generate_opam_files true)

(package
 (name harfbuzz)
 (synopsis "Harfbuzz bindings for OCaml")
 (description "Harfbuzz bindings for OCaml")
 (depends
  (ocaml
   (>= 4.08.0))
  dune
  ctypes
  (alcotest :with-test)
  (odoc :with-doc)))
