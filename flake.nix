{
  description = "A collection of nix flake templates for common project starters";

  outputs = {self}: {
    templates = {
      bevy = {
        path = ./bevy;
        name = "Bevy Template";
        description = ''
          Basic bevy project with release, debug, and test builds.
        '';
      };
    };
  };
}
