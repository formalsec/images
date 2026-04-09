FROM ghcr.io/formalsec/ocaml-4.14

# Install z3
RUN opam install z3 -y

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "bash" ]
