{pkgs, lib, ...}:
pkgs.stdenv.mkDerivation rec {
  pname = "fflorent";
  version = "1.2.3";

  src = ./.;

  installPhase = ''
    mkdir -p $out/share/plymouth/themes/fflorent
    cp $src/* $out/share/plymouth/themes/fflorent/
    find $out/share/plymouth/themes/fflorent -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \; # Adjust paths to point to the nix derivation
  '';

  meta = with lib; {
    description = "F Florent en vrai";
    platforms = platforms.linux;
  };
}

