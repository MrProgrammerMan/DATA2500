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
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              python3
              procps
              xdg-utils
            ];
            shellHook = ''
              cleanup_data2500() {
                if [ -n "''${watch_pid:-}" ]; then
                  watch_pgid=$(ps -o pgid= -p "$watch_pid" 2>/dev/null | tr -d '[:space:]' || true)
                  shell_pgid=$(ps -o pgid= -p "$$" 2>/dev/null | tr -d '[:space:]' || true)

                  if [ -n "$watch_pgid" ] && [ "$watch_pgid" != "$shell_pgid" ]; then
                    kill -TERM -- "-$watch_pgid" 2>/dev/null || true
                  fi

                  pkill -TERM -P "$watch_pid" 2>/dev/null || true
                  kill "$watch_pid" 2>/dev/null || true
                  pkill -KILL -P "$watch_pid" 2>/dev/null || true
                  wait "$watch_pid" 2>/dev/null || true
                fi
                if [ -n "''${serve_pid:-}" ]; then
                  kill "$serve_pid" 2>/dev/null || true
                  wait "$serve_pid" 2>/dev/null || true
                fi
              }

              trap cleanup_data2500 EXIT INT TERM

              python serve.py >/tmp/data2500-serve.log 2>&1 &
              serve_pid=$!

              nix run .#watch >/tmp/data2500-watch.log 2>&1 &
              watch_pid=$!

              echo "Viewer + watch started in background."
              echo "Logs: /tmp/data2500-serve.log, /tmp/data2500-watch.log"
            '';
          };
        };
    };
}