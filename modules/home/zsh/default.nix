{pkgs, ...}: {
  programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    autocd = true;
    dirHashes = {
      dl = "$HOME/dl";
      docs = "$HOME/dox";
      code = "$HOME/dev/";
      dots = "$HOME/dotfiles";
      pics = "$HOME/pix";
      vids = "$HOME/videos";
    };

    dotDir = ".config/zsh";

    history = {
      expireDuplicatesFirst = true;
      path = "$HOME/.cache/zsh_history";
      save = 10000;
      share = true;
    };
    historySubstringSearch = {
      enable = true;
    };

    sessionVariables = rec {
      EDITOR = "nvim";
      VISUAL = EDITOR;
      GIT_EDITOR = EDITOR;
      BROWSER = "vivaldi";
      TERMINAL = "wezterm";
      MANPAGER = "bat";
      PAGER = "bat";

      ANI_CLI_EXTERNAL_MENU = "1";
      ANI_CLI_PLAYER = "mpv";

      MPV_HOST = "localhost";

      GH_FORCE_TTY = "100%";

      FZF_DEFAULT_COMMAND = "rg ~ --files --hidden";
      # Oxocarbon theme
      FZF_DEFAULT_OPTS = "--color=fg:#ffffff,bg:-1,hl:#be95ff --color=fg+:#ffffff,bg+:-1,hl+:#be95ff --color=info:#ee5396,prompt:#ff7eb6,pointer:#42be65 --color=marker:#42be65,spinner:#be95ff,header:#82cfff --reverse --border=rounded --prompt ' λ '";
      FZF_ALT_C_COMMAND = "fd -t d -d 1";
      FZF_ALT_C_OPTS = "--preview 'preview {}'";
      FZF_TMUX_HEIGHT = 40;
    };

    initExtra = ''
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"

      bindkey -v
      export KEYTIMEOUT=1

      function precmd {
      		print -Pn "\e[ q"
      }

      autoload -U colors && colors
      autoload -U compinit && compinit -u
      zle -N custom-fzf-preview

      bindkey '^[f' custom-fzf-preview
      bindkey '^[[A' up-line-or-search

         # disable sort when completing `git checkout`
      zstyle ':completion:*:git-checkout:*' sort false
         # set descriptions format to enable group support
      zstyle ':completion:*:descriptions' format '[%d]'
         # set list-colors to enable filename colorizing
      zstyle ':completion:*' list-colors '\'
         # switch group using `,` and `.`
      zstyle ':fzf-tab:*' switch-group ',' '.'
         # to fix stupid one line preview
      zstyle ':fzf-tab:*' popup-pad 20 0
      zstyle ':fzf-tab:*' fzf-pad 4

         # preview stuff
      zstyle ':fzf-tab:complete:*:*' fzf-preview 'preview $realpath '
      zstyle ':fzf-tab:*' fzf-min-height 100

      source "$(${pkgs.fzf}/bin/fzf-share)/completion.zsh"
      source "$(${pkgs.fzf}/bin/fzf-share)/key-bindings.zsh"
    '';

    shellAliases = {
      # .. = "cd ..";
      mv = "mv -i";
      ls = "eza";
      ll = "eza -Fal";
      l = "eza --long --grid";
      lh = "eza -a";
      tree = "eza -T";
      grep = "grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}";
      nv = "nvim";
      j = "z";
      jj = "cd -";
      mkcd = "mkdir -p $1 && cd $1";
      gc = "git clone $1 && cd $(basename $1 .git)";

      gp = "git pull";
      grhh = "git reset --hard HEAD";
      gap = "git add --patch";
      lg = "lazygit";

      ytdl = "yt-dlp -f 'bv*+ba' --embed-thumbnail --embed-subs --merge-output-format mp4";
      ytdl-mp3 = "yt-dlp --embed-metadata --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail";
      ytdlist = "yt-dlp -f 'bv*[height=1080]+ba'";

      nf = "nix run nixpkgs#neofetch";
    };
  };

  programs.fzf.enableZshIntegration = true;
  programs.eza.enable = true;
  programs.bat.enable = true;

  programs.git = {
    enable = true;
    userName = "justchokingaround";
    userEmail = "ivanonarch@tutanota.com";
    delta.enable = true;
    ignores = ["**/.idea/"];
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
