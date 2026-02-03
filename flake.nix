{
  description = "A collection of nix flake templates for common project starters";

  outputs = {self}: let
    mkTempate = path: name: description: {
      inherit path name description;
    };
  in {
    templates = {
      bevy =
        mkTempate
        ./bevy "Bevy Template" ''
          Starter Bevy project with release, debug, and test builds.
        '';
      den = mkTempate ./den "Den Template" "General purpose dendritic template.";
      go = mkTempate ./go "Go Template" "Basic go project.";
      tui = mkTempate ./tui "Ratatui Template" "Starter Ratatui project";
    };
  };
}
