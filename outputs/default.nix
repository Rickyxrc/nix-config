inputs:
builtins.foldl' (acc: set: acc // set) { } (
  builtins.map (f: import f inputs) [
    ./aarch64-darwin
    ./x86_64-linux
    ./devShell.nix
  ]
)
