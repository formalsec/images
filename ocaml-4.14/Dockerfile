FROM ghcr.io/formalsec/base

# Create OCaml 4.14 switch
RUN opam switch create 4.14 ocaml-base-compiler.4.14.3

# CRITICAL FOR CI: This ensures 'dune', 'ocamlc', etc. are always in the PATH
# without needing to run 'opam exec' every time.
ENV OPAMROOT="/root/.opam"
ENV OPAM_SWITCH_PREFIX="/root/.opam/4.14"
ENV CAML_LD_LIBRARY_PATH="/root/.opam/4.14/lib/stublibs"
ENV OPAMCONFIRMLEVEL=unsafe-yes
ENV PATH="/root/.opam/4.14/bin:${PATH}"

# Pre-install Dune
RUN opam install dune -y

ENTRYPOINT [ "opam", "exec", "--" ]
CMD [ "bash" ]
