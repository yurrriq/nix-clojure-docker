{ system ? builtins.currentSystem
, pkgs ? import <nixpkgs> { inherit system; }
}:

with pkgs;

let

  lein-nix-build = import (pkgs.fetchFromGitHub {
    owner = "nix-hackers";
    repo = "lein-nix-build";
    rev = "98add306b4b86c7f2a106e437901fd276af4631d";
    sha256 = "01q2mrfj31fj2ypgvnzrxfp1b2cdr33xv7pdbqdac79zaz3pa27v";
  });

  jar = lein-nix-build { project = ./.; };

in

dockerTools.buildImage {
  name = "hello-world";
  contents = [ jre jar ];
  config = {
    Cmd = [ "${jre}/bin/java" "-jar" "${jar}" ];
    ExposedPorts = {
      "3000/tcp" = {};
    };
  };
}
