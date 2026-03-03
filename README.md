# ❄ Nix flake project tempates

A simple collection of common nix flake templates.

Templates include boilerplate nix to define common projects I like to work on! Each flake inludes dev and build tools needed for a new project.

## 🙌 Usage

```sh
nix flake init --template "github:GianniBuoni/nix_templates#insert-template-name-here"
```

The above shell command will copy the target flake template into the project directory. Use `direnv edit` to activate a specific devshell.

## Flake contents

- 🐚 Dev shells: defines a dev shell with needed dev and language tools
- 📦 Packages: defines development and build dependencies
- 🪝 Git hooks: defines git hook scripts for development

## 📓 Available projects

| Project Type | Language | Notes                                         |
| ------------ | -------- | --------------------------------------------- |
| den          | N/A      | Generic devshell using the dendritic pattern. |
| rust         | rust     | Rust devshells for development and CI         |
