{pkgs, ...}: {
  packages = with pkgs; [just];

  languages.go.enable = true;
}
