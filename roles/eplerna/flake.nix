{
  description = "EPLerna development shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      lib = nixpkgs.lib;
    in
    {
      devShells.${system}.default = pkgs.mkShell rec {
        name = "EPLerna Shell";

        buildInputs = with pkgs; [
          # Build
          pkg-config

          # Device management
          udev

          # Audio
          alsa-lib

          # Graphics
          libxcb
          xorg.libX11
          xorg.libXcursor
          xorg.libXi
          libxkbcommon
          wayland
        ];

        packages = with pkgs; [
          # Direct dependencies
          cargo
          python3

          # QOL Dependencies
          rust-analyzer
          rustfmt
          cargo-diet

          # bevy dependencies

          glslang
          vulkan-headers
          vulkan-loader
          vulkan-validation-layers
        ];
        
        shellHook = ''
          alias b='cargo build --all-features'
          alias build='cargo build --all-features'
          alias r='cargo build --release --all-features --all-targets'
          alias release="r"
          alias run='cargo run --all-features'
          alias f='cargo fmt'

          echo "Eperlerna development shell initialized."
        '';

        LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}:${lib.makeLibraryPath packages}";
        VK_LAYER_PATH = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
        VULKAN_SDK = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
      };
    };
}
