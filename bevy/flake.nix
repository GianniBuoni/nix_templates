{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nix-community/naersk";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    flake-utils,
    naersk,
    nixpkgs,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = (import nixpkgs) {
          inherit system;
        };
        nativeBuildInputs = [pkgs.pkg-config];
        buildInputs = with pkgs; [
          alsa-lib
          libxkbcommon
          vulkan-loader
          wayland # To use the wayland feature
          udev
          xorg.libX11
          xorg.libXcursor
          xorg.libXi
          xorg.libXrandr # To use the x11 feature
        ];
        naersk' = pkgs.callPackage naersk {};
        defaultPackage = naersk'.buildPackage {
          src = ./.;
          inherit nativeBuildInputs buildInputs;
        };
      in {
        inherit defaultPackage;
        packages = {
          debug = naersk'.buildPackage {
            src = ./.;
            inherit nativeBuildInputs buildInputs;
            release = false;
          };
          test = naersk'.buildPackage {
            src = ./.;
            inherit nativeBuildInputs buildInputs;
            release = false;
            mode = "test";
          };
        };
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs;
            [rustc cargo clippy] ++ buildInputs ++ nativeBuildInputs;
          packages = with pkgs; [just rust-analyzer];
        };
      }
    );
}
