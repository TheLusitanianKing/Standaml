FROM ocaml/opam:debian-12-ocaml-4.08-fp

RUN opam install dune.2.9.3
RUN opam install core.v0.12.4
