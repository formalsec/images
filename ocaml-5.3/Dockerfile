FROM ghcr.io/formalsec/base

# Create OCaml 5.3 switch
RUN opam switch create 5.3 ocaml-base-compiler.5.3.0

# CRITICAL FOR CI: This ensures 'dune', 'ocamlc', etc. are always in the PATH
# without needing to run 'opam exec' every time.
ENV OPAMROOT="/root/.opam"
ENV OPAM_SWITCH_PREFIX="/root/.opam/5.3"
ENV CAML_LD_LIBRARY_PATH="/root/.opam/5.3/lib/stublibs"
ENV OPAMCONFIRMLEVEL=unsafe-yes
ENV PATH="/root/.opam/5.3/bin:${PATH}"

# Pre-install Dune
RUN opam install dune ocamlformat -y

ENTRYPOINT [ "opam", "exec", "--" ]
CMD [ "bash" ]
