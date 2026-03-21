{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    typix = {
      url = "github:loqusion/typix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ { flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { pkgs, system, ... }:
        let
          typixLib = inputs.typix.lib.${system};
          src = builtins.path {
            path = ./.;
            name = "data2500-src";
          };
          sharedArgs = {
            fontPaths = [ ];
            virtualPaths = [ ];
          };
          buildArgs = sharedArgs // {
            typstSource = "04-excercises/oblig1/main.typ";
            inherit src;
          };
          watchArgs = sharedArgs // {
            typstSource = "04-excercises/oblig1/main.typ";
          };
          build-drv = typixLib.buildTypstProject buildArgs;
          build-script = typixLib.buildTypstProjectLocal buildArgs;
          watch-script = typixLib.watchTypstProject watchArgs;
          local-build-script = pkgs.writeShellApplication {
            name = "typst-build-local";
            runtimeInputs = [ pkgs.typst ];
            text = ''
              typst compile 04-excercises/oblig1/main.typ 04-excercises/oblig1/main.pdf
            '';
          };
        in {
          checks = {
            inherit build-drv build-script watch-script;
          };
          packages.default = build-drv;
          packages.oblig1 = build-drv;
          apps = {
            default = {
              type = "app";
              program = pkgs.lib.getExe watch-script;
            };
            watch = {
              type = "app";
              program = pkgs.lib.getExe watch-script;
            };
            build = {
              type = "app";
              program = pkgs.lib.getExe local-build-script;
            };
          };
          devShells.default = typixLib.devShell {
            inherit (sharedArgs) fontPaths virtualPaths;
            packages = [
              watch-script
            ];
          };
        };
    };
}