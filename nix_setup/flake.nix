{
  description = "Tenka Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    homeConfigurations.tenka = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};

      modules = [
        ({ pkgs, ... }: {
          home.username = "tenka";
          home.homeDirectory = "/home/tenka";
          home.stateVersion = "25.11";

          programs.home-manager.enable = true;
          # === PAKET USER ===
            home.packages = with pkgs; [
              bat
              eza
              fd
              fzf
              ripgrep
              zoxide
              htop
              fastfetch
              yazi
              speedtest-cli
              tldr
              duf
              dust
              lazygit
              bottom
              procs
	            neovim
              bluetui
              cowsay
              figlet
              cava
              tmux
            ];

            # === FZF ===
            programs.fzf = {
              enable = true;
              enableZshIntegration = true;
            };

            # === ZOXIDE ===
            programs.zoxide.enable = true;


        })
      ];
    };
  };
}

