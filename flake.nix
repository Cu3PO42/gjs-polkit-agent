{
  description = "A library to write PolKit agents using GJS";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    nixpkgs,
    self,
  }: let
    genSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "x86_64-linux"
    ];
  in {
    packages = genSystems (system: let
      pkgs = import nixpkgs {inherit system;};
      gjs-polkit-agent = pkgs.callPackage ./gjs-polkit-agent.nix {};
    in {
      inherit gjs-polkit-agent;
      default = gjs-polkit-agent;
    });
  };
}
