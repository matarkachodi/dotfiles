{pkgs, ...}: {
  # Configure Helix
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [nixd];
    ignores = [
      "!.gitignore"
    ];
    settings = {
      theme = "nord";
      editor = {
        bufferline = "multiple";
        auto-format = false;
        line-number = "relative";
        color-modes = true;
        text-width = 100;
        end-of-line-diagnostics = "hint";
        gutters = ["diagnostics" "spacer" "line-numbers" "spacer"];
        lsp = {
          display-inlay-hints = true;
          display-progress-messages = true;
        };
        indent-guides = {
          render = true;
          character = "▏";
        };
      };
    };
  };
}
