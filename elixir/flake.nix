{
  description = "Flake with nim 1.6.6 containing dochack and tools";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.default = pkgs.elixir;
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          elixir
        ];
      };
    };
}
