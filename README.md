# Morpheus Nvim

This is my personal configuration for neovim. I started with [lazyman's](https://lazyman.dev) [Modular](https://github.com/VonHeikemen/nvim-starter/tree/05-modular) configuration
and ported most of [AstroNvimPlus](https://astronvim.lazyman.dev/posts/AstroNvimPlus/) from lazyman while changing the structure a little.

This is still very much Work in Progress! It isn't ready for general used yet (or perhaps, never).

You can find some of the original content from the original README.md file below. It is probably out of date with what I currently have configured.

## Configurations

### Minimal

Small configuration without third party plugins.

- [Link to branch](https://github.com/VonHeikemen/nvim-starter/tree/00-minimal)
- [Instructions](https://github.com/VonHeikemen/nvim-starter/blob/00-minimal/README.md)

### Base

Small configuration that includes a plugin manager. It can provide a good base to start your own configuration.

- [Link to branch](https://github.com/VonHeikemen/nvim-starter/tree/01-base)
- [Instructions](https://github.com/VonHeikemen/nvim-starter/blob/01-base/README.md)

### Opinionated

Opinionated configuration. It includes a combination of popular plugins. For the people who are looking to make Neovim their main editor but don't want to start from scratch. Plugins related to "code intellisense" are not included in this config.

- [Link to branch](https://github.com/VonHeikemen/nvim-starter/tree/02-opinionated)
- [Instructions](https://github.com/VonHeikemen/nvim-starter/blob/02-opinionated/README.md)

### LSP

Example configuration showing how to configure the built-in LSP client with autocompletion. It is based on `02-opinionated`.

- [Link to branch](https://github.com/VonHeikemen/nvim-starter/tree/03-lsp)
- [Instructions](https://github.com/VonHeikemen/nvim-starter/blob/03-lsp/README.md)

### LSP Installer

Same as `lsp` but uses [mason.nvim](https://github.com/williamboman/mason.nvim) to install language servers.

- [Link to branch](https://github.com/VonHeikemen/nvim-starter/tree/04-lsp-installer)
- [Instructions](https://github.com/VonHeikemen/nvim-starter/blob/04-lsp-installer/README.md)

### Modular

Same as `lsp installer` but everything is split in modules.

- [Link to branch](https://github.com/VonHeikemen/nvim-starter/tree/05-modular)
- [Instructions](https://github.com/VonHeikemen/nvim-starter/blob/05-modular/README.md)

## Other template configurations

- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [Launch.nvim](https://github.com/LunarVim/Launch.nvim)
- [tinyvim](https://github.com/NvChad/tinyvim)
- [dope](https://github.com/glepnir/dope)

## Example setups

### Light

Minimal configuration focused on providing "basic features" with little boilerplate. With less than 200 lines of code: includes improved syntax highlight, a fuzzy finder and a ready made LSP setup with autocompletion.

- [Link to branch](https://github.com/VonHeikemen/nvim-starter/tree/xx-light)
- [Instructions](https://github.com/VonHeikemen/nvim-starter/blob/xx-light/README.md)

### lsp-cmp

Minimal setup with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).

- [Link to branch](https://github.com/VonHeikemen/nvim-starter/tree/xx-lsp-cmp)
- [Instructions](https://github.com/VonHeikemen/nvim-starter/blob/xx-lsp-cmp/README.md)

### mason.nvim

Minimal setup with mason.nvim.

- [Link to branch](https://github.com/VonHeikemen/nvim-starter/tree/xx-mason)
- [Instructions](https://github.com/VonHeikemen/nvim-starter/blob/xx-mason/README.md)

### LSP without plugins

Example lua configuration showing one way to setup LSP servers without plugins.

- [Link to branch](https://github.com/VonHeikemen/nvim-starter/tree/xx-basic-lsp)
- [Instructions](https://github.com/VonHeikemen/nvim-starter/blob/xx-basic-lsp/README.md)

### User plugins

Configuration without 3rd party plugins. Includes "small user plugins" to provide its features.

- [Link to branch](https://github.com/VonHeikemen/nvim-starter/tree/xx-user-plugins)
- [Instructions](https://github.com/VonHeikemen/nvim-starter/blob/xx-user-plugins/README.md)

## Learn how to configure Neovim

- [Move from init.vim to init.lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)
- [A guide on Neovim's LSP client](https://vonheikemen.github.io/devlog/tools/neovim-lsp-client-guide/)
- [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide)

## Videos

- [Vim As Your Editor - Introduction](https://www.youtube.com/watch?v=X6AR2RMB5tE)
- [Vim As Your Editor - Horizontal Movements](https://youtu.be/5JGVtttuDQA)
- [Vim As Your Editor - Vertical Movements](https://www.youtube.com/watch?v=KfENDDEpCsI)
- [Understanding Neovim - Installation, creating init.lua](https://www.youtube.com/watch?v=87AXw9Quy9U)
- [Understanding Neovim - Plugins, colorschemes](https://www.youtube.com/watch?v=87AXw9Quy9U)
- [Understanding Neovim - "Proper structure"](https://www.youtube.com/watch?v=87AXw9Quy9U)
- [Understanding Neovim - Treesitter](https://www.youtube.com/watch?v=kYXcxJxJVxQ)
- [Understanding Neovim - Lua syntax and Treesitter modules](https://www.youtube.com/watch?v=ff0GYrK3nT0)
- [Understanding Neovim - vim options](https://www.youtube.com/watch?v=Cp0iap9u29c)
- [Neovim Builtin LSP Setup Guide](https://www.youtube.com/watch?v=puWgHa7k3SY)
- [Debugging in Neovim](https://www.youtube.com/watch?v=0moS8UHupGc)
- [Mastering The Macro Machine - Vimconf.live 2021](https://www.youtube.com/watch?v=ZMA6MghrpWM)

- # [Building a Neovim plugin (in lua) from scratch](https://www.youtube.com/watch?v=n4Lp4cV8YR0)

## Requirements

- Neovim v0.8 or greater.
- git.
- A `C` compiler. Can be `gcc`, `tcc` or `zig`.
- [make](https://www.gnu.org/software/make/), the build tool.
- [npm cli](https://docs.npmjs.com/cli/v8/commands/npm). Javascript package manager.
- [nodejs](https://nodejs.org/es/). Javascript runtime. Required by the language servers listed above.
- (optional) [ripgrep](https://github.com/BurntSushi/ripgrep). Improves project wide search speed.
- (optional) [fd](https://github.com/sharkdp/fd). Improves file search speed.
- (optional) A patched font to display icons. I hear [nerdfonts](https://www.nerdfonts.com/) has a good collection.

> Here's the config [compatible with v0.7](https://github.com/VonHeikemen/nvim-starter/tree/4e7ccba7e69182f3dc1ee2f27be66677118c35b6).

## Installation

- Backup your existing configuration if you have one.

- If you don't know the path of the Neovim configuration folder use this command.

```sh
nvim --headless -c 'echo stdpath("config") | quit'
```

- Now clone this repository in that location.

```sh
git clone https://github.com/VonHeikemen/nvim-starter /tmp/nvim-config-path
```

> Do not execute this command as is. Replace `/tmp/nvim-config-path` with the correct path from the previous step.

- Move to the configuration folder where you clone the repository. Change branch to `05-modular`.

```sh
git checkout 05-modular
```

- Next time you start Neovim all plugins will be downloaded automatically. After this process is done `nvim-treesitter` will install language parsers for treesitter. And, `mason.nvim` will download language servers listed in the configuration. Use the command `:Mason` to check the download process of language servers.

## Keybindings

Leader key: `Space`.

| Mode   | Key               | Action                                                                  |
| ------ | ----------------- | ----------------------------------------------------------------------- |
| Normal | `<leader>h`       | Go to first non empty character in line.                                |
| Normal | `<leader>l`       | Go to last non empty character in line.                                 |
| Normal | `<leader>a`       | Select all text.                                                        |
| Normal | `gy`              | Copy selected text to clipboard.                                        |
| Normal | `gp`              | Paste clipboard content.                                                |
| Normal | `<leader>w`       | Save file.                                                              |
| Normal | `<leader>bq`      | Close current buffer.                                                   |
| Normal | `<leader>bc`      | Close current buffer while preserving the window layout.                |
| Normal | `<leader>bl`      | Go to last active buffer.                                               |
| Normal | `<leader>?`       | Search oldfiles history.                                                |
| Normal | `<leader><space>` | Search open buffers.                                                    |
| Normal | `<leader>ff`      | Find file in current working directory.                                 |
| Normal | `<leader>fg`      | Search pattern in current working directory. Interactive "grep search". |
| Normal | `<leader>fd`      | Search diagnostics in current file.                                     |
| Normal | `<leader>fs`      | Search pattern in current file.                                         |
| Normal | `<leader>e`       | Open file explorer.                                                     |
| Normal | `<Ctrl-g>`        | Toggle the builtin terminal.                                            |
| Normal | `K`               | Displays hover information about the symbol under the cursor.           |
| Normal | `gd`              | Jump to the definition.                                                 |
| Normal | `gD`              | Jump to declaration.                                                    |
| Normal | `gi`              | Lists all the implementations for the symbol under the cursor.          |
| Normal | `go`              | Jumps to the definition of the type symbol                              |
| Normal | `gr`              | Lists all the references.                                               |
| Normal | `gs`              | Displays a function's signature information.                            |
| Normal | `<F2>`            | Renames all references to the symbol under the cursor.                  |
| Normal | `<F3>`            | Format code in current buffer.                                          |
| Normal | `<F4>`            | Selects a code action available at the current cursor position.         |
| Visual | `<F4>`            | Selects a code action available in the selected text.                   |
| Normal | `gl`              | Show diagnostics in a floating window.                                  |
| Normal | `[d`              | Move to the previous diagnostic.                                        |
| Normal | `]d`              | Move to the next diagnostic.                                            |

### Autocomplete keybindings

| Mode   | Key           | Action                                                                   |
| ------ | ------------- | ------------------------------------------------------------------------ |
| Insert | `<Up>`        | Move to previous item.                                                   |
| Insert | `<Down>`      | Move to next item.                                                       |
| Insert | `<Ctrl-p>`    | Move to previous item.                                                   |
| Insert | `<Ctrl-n>`    | Move to next item.                                                       |
| Insert | `<Ctrl-u>`    | Scroll up in documentation window.                                       |
| Insert | `<Ctrl-d>`    | Scroll down in documentation window.                                     |
| Insert | `<Ctrl-e>`    | Cancel completion.                                                       |
| Insert | `<C-y>`       | Confirm completion.                                                      |
| Insert | `<Enter>`     | Confirm completion.                                                      |
| Insert | `<Ctrl-f>`    | Go to next placeholder in snippet.                                       |
| Insert | `<Ctrl-b>`    | Go to previous placeholder in snippet.                                   |
| Insert | `<Tab>`       | If completion menu is open, go to next item. Else, open completion menu. |
| Insert | `<Shift-Tab>` | If completion menu is open, go to previous item.                         |

## Plugin list

| Name                                                                                          | Description                                                         |
| --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                                               | Plugin manager.                                                     |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)                                   | Collection of colorscheme for Neovim.                               |
| [onedark.vim](https://github.com/joshdick/onedark.vim)                                        | Colorscheme based on Atom's default theme.                          |
| [monokai.nvim](https://github.com/tanvirtin/monokai.nvim)                                     | Colorscheme based on Sublime text's default theme.                  |
| [darkplus.nvim](https://github.com/lunarvim/darkplus.nvim)                                    | Colorscheme based on VS Code's default theme.                       |
| [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)                          | Helper functions to show icons.                                     |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                                  | Pretty statusline.                                                  |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)                                 | Pretty tabline.                                                     |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)               | Shows indent guides in current file.                                |
| [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)                                  | File explorer.                                                      |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                            | Fuzzy finder.                                                       |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)      | Extension for telescope. Allows fzf-like syntax in searches.        |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                                   | Shows indicators in gutter based on file changes detected by git.   |
| [vim-fugitive](https://github.com/tpope/vim-fugitive)                                         | Git integration into Neovim/Vim.                                    |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                         | Configures treesitter parsers. Provides modules to manipulate code. |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Creates textobjects based on treesitter queries.                    |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim)                                      | Toggle comments.                                                    |
| [vim-surround](https://github.com/tpope/vim-surround)                                         | Add, remove, change "surroundings".                                 |
| [targets.vim](https://github.com/wellle/targets.vim)                                          | Creates new textobjects.                                            |
| [vim-repeat](https://github.com/tpope/vim-repeat)                                             | Add "repeat" support for plugins.                                   |
| [vim-bbye](https://github.com/moll/vim-bbye)                                                  | Close buffers without closing the current window.                   |

| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
