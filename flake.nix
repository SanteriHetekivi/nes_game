{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          cc65    # 6502 Assembler (ca65) and linker (ld65).
          fceux   # NES Emulator.
          gnumake # Make.
        ];

        shellHook = ''
          echo "Development: NES"
          echo "Assembler:   $(ca65 -V 2>&1)"
          echo "Linker:      $(ld65 -V 2>&1)"
          echo "Emulator:    fceux $(fceux --version)"
          echo "Make:        $(make -v | head -n 1)"
        '';
      };
    };
}