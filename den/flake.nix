{
  description = "GianniBuoni's dendritic nix bootstrapper.";

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./nix);

  inputs = {
    # core
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    import-tree.url = "github:vic/import-tree";
    # dentrtic
    flake-aspects.url = "github:vic/flake-aspects";
    flake-file.url = "github:vic/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    # systems
    systems = {
      url = "github:nix-systems/default";
      flake = false;
    };
  };
}
