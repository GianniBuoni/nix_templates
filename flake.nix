{
  description = "A collection of nix flake templates for common project starters";

  outputs = {self}: let
    mkTempate = path: name: description: {
      inherit path name description;
    };
  in {
    templates = {
      den = mkTempate ./den "Den Template" "General purpose dendritic template.";
    };
  };
}
