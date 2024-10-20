{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      setup

      ef-themes
      dimmer
      nano-modeline
      moody
      minions
      mlscroll
      nerd-icons
      nerd-icons-corfu
      imenu-list
      spacious-padding

      treemacs
      treemacs-nerd-icons
      treemacs-icons-dired
      treemacs-magit
      activities
      diff-hl

      vertico
      vertico-posframe
      consult
      consult-dir
      consult-flycheck
      consult-eglot
      embark-consult
      marginalia
      orderless
      embark
      
      meow
      vundo
      corfu
      corfu-terminal
      puni
      which-key
      visual-regexp

      rainbow-mode
      rainbow-delimiters

      reformatter
      (treesit-grammars.with-grammars
        (p:
          with p; [
            tree-sitter-bash
            tree-sitter-c
            tree-sitter-cpp
            tree-sitter-css
            tree-sitter-scss
            tree-sitter-elisp
            tree-sitter-html
            tree-sitter-javascript
            tree-sitter-json
            tree-sitter-make
            tree-sitter-markdown
            tree-sitter-markdown-inline
            tree-sitter-nix
            tree-sitter-python
            tree-sitter-rust
            tree-sitter-toml
            tree-sitter-tsx
            tree-sitter-typescript
            tree-sitter-yaml
          ]))
      eglot
      aggressive-indent
      clojure-mode
      clojure-ts-mode
      eros
      markdown-mode
      nix-ts-mode
      org-bullets
      org-side-tree
      rust-mode
      cargo

      flycheck
      magit
      difftastic
    ];
    extraConfig = ''
      (use-package ef-themes
        :)
    '';
  };
  services.emacs = {
    enable = true;
    client.enable = true;
  };
}
