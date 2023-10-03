{ config, pkgs, ... }: {

	programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;
    autocd = true;
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "c2b4aa5ad2532cca91f23908ac7f00efb7ff09c9";
          sha256 = "sha256-gvZp8P3quOtcy1Xtt1LAW1cfZ/zCtnAmnWqcwrKel6w=";
        };
      }
    ];
    history = {
      path = "$HOME/.cache/zsh_history";
      save = 10000;
      share = true;
    };
    historySubstringSearch = {
      enable = true;
    };
    initExtra = builtins.concatStringsSep "\n" [
      (builtins.readFile ./zshrc)
    ];
  };

	programs.eza.enable = true;
	programs.bat.enable = true;

	programs.git = {
			enable = true;
			userName = "justchokingaround";
			userEmail = "ivanonarch@tutanota.com";
			delta.enable = true;
			ignores = [ "**/.idea/" ];
			extraConfig = {
				init.defaultBranch = "main";
			};
	};

	programs.starship = {
			enable = true;
			settings = {
				scan_timeout = 10;
				format = "$directory$git_branch$git_metrics$nix_shell$package$character";
				add_newline = false;
				line_break.disabled = true;
				directory.style = "cyan";
				character = {
					success_symbol = "[λ](green)";
					error_symbol = "[λ](red)";
				};
				git_branch = {
					style = "purple";
					symbol = "";
				};
				git_metrics = {
					disabled = false;
					added_style = "bold yellow";
					deleted_style = "bold red";
				};
				package.format = "version [$version](bold green) ";
				nix_shell.symbol = " ";
			};
	};
}
