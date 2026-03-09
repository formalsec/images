FROM ghcr.io/formalsec/ocaml-5.4

# Install cvc5
RUN opam install cvc5 -y

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "bash" ]
