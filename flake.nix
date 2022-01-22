{
  description = "A very basic flake";

  # Provides abstraction to boiler-code when specifying multi-platform outputs.
  inputs.flake-utils.url = "github:numtide/flake-utils";

  # inputs.mozilla.url = "github:mozilla/nixpkgs-mozilla";
  # inputs.mozilla.flake = false;

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
          rec {
            apps.hello = flake-utils.lib.mkApp { drv = packages.hello; };

            packages = flake-utils.lib.flattenTree {
              hello = pkgs.hello;
            };
            defaultPackage = packages.hello;

            defaultApp = apps.hello;

            devShell = pkgs.mkShell {
              buildInputs = [
                pkgs.rust-analyzer
                pkgs.cargo-watch
                # rust
              ];
            };
          }
    ) // {
      # defaultPackage.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.ripgrep;
      # defaultApp.x86_64-darwin = flake-utils.lib.mkApp {
      #   drv = nixpkgs.legacyPackages.x86_64-darwin.ripgrep;
      # };


      #   packages.${system}.ripgrep = pkgs.legacyPackages.${system}.ripgrep;

      # defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;
      # defaultPackage.x86_64-darwin = self.packages.x86_64-darwin.hello;
      # defaultPackage.${system} = self.packages.${system}.hello;

    };
}
