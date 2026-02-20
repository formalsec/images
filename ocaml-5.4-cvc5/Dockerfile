FROM ghcr.io/formalsec/ocaml-5.4

# Install cvc5
RUN opam install cvc5 -y

ENTRYPOINT [ "opam", "exec", "--" ]
CMD [ "bash" ]
