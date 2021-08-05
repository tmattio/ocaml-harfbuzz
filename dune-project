(lang dune 2.0)

(name ocaml-harfbuzz)

(documentation "https://tmattio.github.io/ocaml-harfbuzz/")

(source
 (github tmattio/ocaml-harfbuzz))

(license ISC)

(authors
  "Thibaut Mattio")

(maintainers
  "Thibaut Mattio")

(generate_opam_files true)

(package
 (name ocaml-harfbuzz)
 (synopsis "Harfbuzz bindings for OCaml")
 (description "Harfbuzz bindings for OCaml")
 (depends
  (ocaml (>= 4.08.0))
  dune
  (alcotest :with-test)
  (odoc :with-doc)))
