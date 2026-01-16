# Neovim Configuration

A modular, Lua-based Neovim configuration focused on clarity, performance, and sane defaults.

This repository mirrors the exact layout of `~/.config/nvim` and is intended to be used as-is. It also includes a `clangd` configuration directory for convenient, language-specific C/C++ setup.

---

## Layout

```text
~/.config/nvim
├── init.lua                # Main entry point
├── vim-options.lua         # Core Neovim options
├── lazy-lock.json          # Plugin lockfile (lazy.nvim)
├── .luarc.json             # Lua language server config
└── lua/
    ├── plugins/            # Plugin configurations
    │   ├── alpha.lua              # Startup dashboard
    │   ├── catppuccin.lua         # Colorscheme
    │   ├── debugging.lua          # DAP setup
    │   ├── indent-blankline.lua   # Indentation guides
    │   ├── lsp-autocompletion.lua # nvim-cmp + sources
    │   ├── lsp-config.lua         # LSP servers & keymaps (C, C++, Lua)
    │   ├── neotree.lua            # File explorer
    │   ├── none-ls.lua            # Formatting & linting
    │   ├── telescope.lua          # Fuzzy finder
    │   ├── treesitter.lua         # Syntax highlighting
    │   └── visual_multi.lua       # Multi-cursor editing
    └── snippets/           # LuaSnip snippets
        ├── cpp.lua                # C++ snippets
        └── python.lua             # Python snippets

~/.config/clangd
├── config.yaml             # clangd configuration (C/C++ specific)
```

---

## Plugin Manager

This setup uses **lazy.nvim**. Plugin versions are pinned via `lazy-lock.json` for reproducibility.

---

## Features

* Lua-only configuration
* LSP setup with autocompletion
* Separate configuration for **C** and **C++** via `clangd`
* Lua LSP configured for Neovim development
* Treesitter-based highlighting
* Debug Adapter Protocol (DAP)
* Telescope-powered navigation
* Neo-tree file explorer
* none-ls for formatting and linting
* Language-specific snippets (C++, Python)
* Minimal and readable structure

---

## Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone the repository
git clone <repo-url> ~/.config/nvim

# (Optional but recommended) Copy clangd config
mkdir -p ~/.config/clangd
cp -r clangd/* ~/.config/clangd/

# Start Neovim
nvim
```

Plugins install automatically on first launch.

---

## Customization Guide

* **Editor options**: `vim-options.lua`
* **Plugins**: `lua/plugins/`
* **LSP & completion**: `lsp-config.lua`, `lsp-autocompletion.lua`
* **clangd (C/C++)**: `~/.config/clangd/config.yaml`
* **Snippets**: `lua/snippets/`

Each plugin or tool is configured in its own file to keep concerns isolated.

---

## Notes

* Assumes Neovim ≥ 0.9
* Optimized primarily for C, C++, and Python development
* C/C++ behavior is split cleanly using `clangd` configuration
* Lua tooling is configured specifically for editing Neovim configs

---

## License

MIT
