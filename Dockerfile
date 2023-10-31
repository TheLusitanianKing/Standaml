FROM ocaml/opam:debian-12-ocaml-4.08-fp

# not ideal, but only used by GitHub actions for now
USER root

# install basic dependencies
RUN opam install dune.2.9.3 core.v0.12.4
# install cohttp dependencies
RUN sudo apt update && sudo apt install -y libssl-dev pkg-config libgmp-dev && \
  opam install cohttp-lwt-unix.5.2.0 cohttp-async.5.2.0 lwt_ssl
