{ mkDerivation, fetchpatch }:

# How to obtain `sha256`:
# nix-prefetch-url --unpack https://github.com/erlang/otp/archive/OTP-${version}.tar.gz
mkDerivation {
  version = "19.2";
  sha256 = "06pr4ydrqpp1skx85zjb1an4kvzv6vacb771vy71k54j7w6lh9hk";

  patches = [
    # macOS 10.13 crypto fix from OTP-20.1.2
    (fetchpatch {
      name = "darwin-crypto.patch";
      url =
        "https://github.com/erlang/otp/commit/882c90f72ba4e298aa5a7796661c28053c540a96.patch";
      sha256 = "1gggzpm8ssamz6975z7px0g8qq5i4jqw81j846ikg49c5cxvi0hi";
    })
  ];

  prePatch = ''
    substituteInPlace configure.in --replace '`sw_vers -productVersion`' "''${MACOSX_DEPLOYMENT_TARGET:-10.12}"
  '';
}
