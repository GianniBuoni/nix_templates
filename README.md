# ❄ Nix flake project tempates

A simple collection of common nix flake templates.

Templates include boilerplate nix to define common projects I like to work on! Each flake inludes dev and build tools needed for a new project.

## 🙌 Usage

```sh
nix flake init --template "github:GianniBuoni/nix_templates#insert-template-name-here"
```

The above shell command will copy the target flake template and a `.envrc` into the project directory.

## Flake contents

- 📦 Packages: define a set of packages with release and test builds.
- 🐚 Dev shells: defines a dev shell with needed dev and language tools.o

## 📓 Available projects

| Project Type | Language | Notes                                             |
| ------------ | -------- | ------------------------------------------------- |
| bevy         | rust     | Probably needs Mac/Windows target added to flake. |
| go           | go       | Basic go project.                                 |
| tui          | rust     | Generic enough to use for other rust projects.    |
