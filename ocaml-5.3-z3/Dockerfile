FROM ghcr.io/formalsec/ocaml-5.3

# Install z3
RUN opam install z3 -y

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "bash" ]
