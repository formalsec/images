FROM ghcr.io/formalsec/ocaml-5.4

# Install z3
RUN opam install z3 -y

ENTRYPOINT [ "opam", "exec", "--" ]
CMD [ "bash" ]
