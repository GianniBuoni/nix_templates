{
  description = "Go Template";

  inputs = {
    devenv.url = "github:cachix/devenv";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    devenv,
    nixpkgs,
    flake-utils,
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = (import nixpkgs) {inherit system;};
        nativeBuildInputs = with pkgs; [pkg-config];
        buildInputs = [];
        mkApp = name: {
          src = ./.;
          inherit name nativeBuildInputs buildInputs;
          # run `go mod vendor` to keep hash null
          # or pass in `pkgs.lib.fakeHash` to get hash value for dependancies
          vendorHash = null;
        };
      in {
        packages.default = pkgs.buildGoModule (mkApp "main");
        devShells.default = devenv.lib.mkShell {
          inherit pkgs inputs;
          modules = [./devenv.nix];
        };
      }
    );
}
