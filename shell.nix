with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "corplink-env";
  buildInputs = [
    rustc
    cargo
    go
    openssl
    pkg-config
    llvmPackages.libclang
  ];

  # Set Environment Variables
  RUST_BACKTRACE = 1;
  LIBCLANG_PATH="${llvmPackages.libclang.lib}/lib";
  BINDGEN_EXTRA_CLANG_ARGS="-isystem ${stdenv.cc.cc}/include/c++/${lib.getVersion stdenv.cc.cc} -isystem ${stdenv.cc.cc}/include/c++/${lib.getVersion stdenv.cc.cc}/${stdenv.hostPlatform.config} -idirafter ${stdenv.cc.cc}/lib/gcc/${stdenv.hostPlatform.config}/${lib.getVersion stdenv.cc.cc}/include";
}
