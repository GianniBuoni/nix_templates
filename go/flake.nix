{
  description = "Go Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = (import nixpkgs) {inherit system;};
        nativeBuildInputs = with pkgs; [
          go
          gopls
          just
        ];
        buildInputs = [];
        mkApp = name: {
          src = ./.;
          inherit name buildInputs;
          # run `go mod vendor` to keep hash null
          # or pass in `pkgs.lib.fakeHash` to get hash value for dependancies
          vendorHash = null;
        };
      in {
        packages.default = pkgs.buildGoModule (mkApp "main");
        devShells.default = pkgs.mkShell {
          inherit nativeBuildInputs buildInputs;
        };
      }
    );
}
