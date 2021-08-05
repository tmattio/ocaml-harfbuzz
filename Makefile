.DEFAULT_GOAL := all

ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(ARGS):;@:)

.PHONY: all
all:
	opam exec -- dune build --root . @install

.PHONY: deps
deps: ## Install development dependencies
	opam install -y dune-release ocamlformat utop ocaml-lsp-server
	opam install --deps-only --with-test --with-doc -y .

.PHONY: create_switch
create_switch: ## Create an opam switch without any dependency
	opam switch create . --no-install -y

.PHONY: switch
switch: ## Create an opam switch and install development dependencies
	opam install . --deps-only --with-doc --with-test
	opam install -y dune-release ocamlformat utop ocaml-lsp-server

.PHONY: lock
lock: ## Generate a lock file
	opam lock -y .

.PHONY: build
build: ## Build the project, including non installable libraries and executables
	opam exec -- dune build --root .

.PHONY: install
install: all ## Install the packages on the system
	opam exec -- dune install --root .

.PHONY: start
start: all ## Run the produced executable
	opam exec -- dune exec --root . bin/main.exe $(ARGS)

.PHONY: test
test: ## Run the unit tests
	opam exec -- dune runtest --root .

.PHONY: clean
clean: ## Clean build artifacts and other generated files
	opam exec -- dune clean --root .

.PHONY: doc
doc: ## Generate odoc documentation
	opam exec -- dune build --root . @doc

.PHONY: servedoc
servedoc: doc ## Open odoc documentation with default web browser
	open _build/default/_doc/_html/index.html

.PHONY: fmt
fmt: ## Format the codebase with ocamlformat
	opam exec -- dune build --root . --auto-promote @fmt

.PHONY: watch
watch: ## Watch for the filesystem and rebuild on every change
	opam exec -- dune build --root . --watch

.PHONY: utop
utop: ## Run a REPL and link with the project's libraries
	opam exec -- dune utop --root . lib -- -implicit-bindings

.PHONY: release
release: all ## Run the release script 
	opam exec -- dune-release tag
	opam exec -- dune-release distrib
	opam exec -- dune-release publish distrib -y
	opam exec -- dune-release opam pkg
	opam exec -- dune-release opam submit --no-auto-open -y

LATEST_TAG := \
  git for-each-ref refs/tags \
    --sort=-taggerdate --format='%(refname:short)' --count=1

.PHONY : upgrade-harfbuzz
upgrade-harfbuzz :
	(cd src/c/vendor/harfbuzz && git fetch)
	(cd src/c/vendor/harfbuzz && git checkout `$(LATEST_TAG)`)
	make clean
	make eject-build
	ocaml src/gen/headers.ml
	(make && make test) || true

AUTOGEN_OUTPUT := src/c/vendor/configure
AUTOGEN_SCRATCH := harfbuzz-scratch

.PHONY: eject-build
eject-build:
	rm -rf $(AUTOGEN_SCRATCH)
	cp -r src/c/vendor/harfbuzz $(AUTOGEN_SCRATCH)
	(cd $(AUTOGEN_SCRATCH) && ./autogen.sh)
	rm -rf $(AUTOGEN_OUTPUT)
	mkdir -p $(AUTOGEN_OUTPUT)
	mkdir -p $(AUTOGEN_OUTPUT)/m4
	mkdir -p $(AUTOGEN_OUTPUT)/docs/
	mkdir -p $(AUTOGEN_OUTPUT)/src/
	mkdir -p $(AUTOGEN_OUTPUT)/src/.deps/
	mkdir -p $(AUTOGEN_OUTPUT)/test/
	mkdir -p $(AUTOGEN_OUTPUT)/test/api/
	mkdir -p $(AUTOGEN_OUTPUT)/test/api/.deps/
	mkdir -p $(AUTOGEN_OUTPUT)/test/fuzzing/
	mkdir -p $(AUTOGEN_OUTPUT)/test/fuzzing/.deps
	mkdir -p $(AUTOGEN_OUTPUT)/test/shaping/
	mkdir -p $(AUTOGEN_OUTPUT)/test/shaping/data/
	mkdir -p $(AUTOGEN_OUTPUT)/test/shaping/data/aots/
	mkdir -p $(AUTOGEN_OUTPUT)/test/shaping/data/in-house/
	mkdir -p $(AUTOGEN_OUTPUT)/test/shaping/data/text-rendering-tests/
	mkdir -p $(AUTOGEN_OUTPUT)/test/subset/
	mkdir -p $(AUTOGEN_OUTPUT)/test/subset/data/
	mkdir -p $(AUTOGEN_OUTPUT)/test/subset/data/repack_tests/
	mkdir -p $(AUTOGEN_OUTPUT)/util/
	mkdir -p $(AUTOGEN_OUTPUT)/util/.deps/
	(diff -qr src/c/vendor/harfbuzz $(AUTOGEN_SCRATCH) || true) \
	  | sed 's#^Only in ##' \
	  | sed 's#: #/#' \
	  | sed 's#^$(AUTOGEN_SCRATCH)/##' \
	  | xargs -I FILE cp -r $(AUTOGEN_SCRATCH)/FILE $(AUTOGEN_OUTPUT)/FILE
	rm -rf $(AUTOGEN_SCRATCH)
	(cd $(AUTOGEN_OUTPUT) && rm -rf aclocal.m4 autom4te.cache m4)
	(cd src/c/vendor/harfbuzz && git rev-parse HEAD) \
	  > $(AUTOGEN_OUTPUT)/commit-hash
