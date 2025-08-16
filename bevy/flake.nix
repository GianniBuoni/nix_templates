{
  description = ''
    Starter Bevy dev and build flake. Includes needed dependancies for project to build on a Linux machine.
  '';
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
        pkgs = (import nixpkgs) {inherit system;};
        nativeBuildInputs = with pkgs; [
          cargo
          clippy
          just
          rustc
          rust-analyzer
          pkg-config
        ];
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
        mkApp = release: mode: {
          src = ./.;
          inherit nativeBuildInputs buildInputs release mode;
        };
      in {
        packages = {
          default = naersk'.buildPackage (mkApp true "build");
          debug = naersk'.buildPackage (mkApp false "build");
          test = naersk'.buildPackage (mkApp false "test");
        };
        devShell = pkgs.mkShell {
          inherit nativeBuildInputs buildInputs;
        };
      }
    );
}
