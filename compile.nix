{stdenv, csmith, seed}:

stdenv.mkDerivation {
  name = "prog";
  version = "0";
  buildInputs = [ csmith ];
  src = ./.;
  seed = toString seed;
  preConfigure = ''
    export csmith_include_dir=-I`realpath ${csmith}/include/csmith-*`
    export NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE $csmith_include_dir"
  '';
}
