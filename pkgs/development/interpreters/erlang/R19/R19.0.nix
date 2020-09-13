{ mkDerivation, fetchpatch }:

# How to obtain `sha256`:
# nix-prefetch-url --unpack https://github.com/erlang/otp/archive/OTP-${version}.tar.gz
mkDerivation {
  version = "19.0";
  sha256 = "08gihaq4pq45j29f0klzsn9lkidd0yp8ph6arfbcain4i8cxhnp5";

  prePatch = ''
    substituteInPlace configure.in --replace '`sw_vers -productVersion`' "''${MACOSX_DEPLOYMENT_TARGET:-10.12}"
  '';
}
