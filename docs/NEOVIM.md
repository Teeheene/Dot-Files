# Neovim Setup Guide 

Complete guide to setting up your custom Neovim configuration with all dependencies and keybindings.

## Installation

### 1. Install Neovim (Arch)

```bash
sudo pacman -S neovim
```

Verify installation:
```bash
nvim --version
```

### 2. Install Dependencies (Arch)

These are required for various plugins and language servers to work properly.

```bash
# Core tools
sudo pacman -S git ripgrep nodejs npm python

# C/C++ support
sudo pacman -S base-devel clang

# Lua
sudo pacman -S lua

# Git integration
sudo pacman -S lazygit

# Dotfiles management
sudo pacman -S stow
```

### 3. Clone/Setup Config

If you don't have the config yet:

```bash
mkdir -p ~/.config/nvim/lua/plugins
mkdir -p ~/.config/nvim/lua/teehee
```

Copy all the files from the config into these directories.

---

## File Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── lazy-lock.json        # Plugin lock file (auto-generated)
└── lua/
    ├── teehee/
    │   ├── init.lua      # Loads lazy, remap, set
    │   ├── lazy.lua      # lazy.nvim bootstrap
    │   ├── remap.lua     # All keybindings
    │   └── set.lua       # Editor settings
    └── plugins/
        ├── init.lua      # Loads all plugins
        ├── autopairs.lua # Auto-close brackets
        ├── colors.lua    # Strawberry light theme
        ├── emmet.lua     # HTML/CSS expansion
        ├── lazygit.lua   # Git UI
        ├── lualine.lua   # Status bar
        ├── nvim-tree.lua # File explorer
        ├── telescope.lua # Fuzzy finder
        ├── treesitter.lua # Syntax highlighting
        └── undotree.lua  # Undo history
```

---

## Plugins Installed

| Plugin | Purpose | Keybind |
|--------|---------|---------|
| **lazy.nvim** | Plugin manager | - |
| **strawberry** | Light theme | Auto-loaded |
| **nvim-treesitter** | Syntax highlighting | - |
| **telescope.nvim** | Fuzzy file finder | `<leader>pf` |
| **nvim-autopairs** | Auto-close brackets | Insert mode |
| **emmet-vim** | HTML/CSS expansion | `<C-e>` |
| **lazygit.nvim** | Git UI | `<leader>lg` / `<leader>lf` |
| **undotree** | Undo history | `<leader>u` |
| **nvim-tree.lua** | File explorer | `<C-b>` |
| **lualine.nvim** | Status bar | Auto-loaded |
| **nvim-ts-autotag** | Auto HTML tags | Insert mode |

---

## Keybindings

### Navigation & Movement

| Keybind | Action |
|---------|--------|
| `<leader>pv` | Open file explorer (netrw) |
| `<C-b>` | Toggle nvim-tree (file sidebar) |
| `<C-d>` | Half page down (centered) |
| `<C-u>` | Half page up (centered) |
| `n` / `N` | Next/previous search result (centered) |

### Editing

| Keybind | Action |
|---------|--------|
| `J` | Join lines (keep cursor position) |
| `<V>J` | Move visual block down |
| `<V>K` | Move visual block up |
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<leader>p` | Paste without yanking deleted content |
| `<leader>d` | Delete to void register (don't yank) |
| `<leader>s` | Find and replace word under cursor |
| `<leader>f` | Format code (LSP) |

### Search & Replace

| Keybind | Action |
|---------|--------|
| `<leader>pf` | Find files |
| `<C-p>` | Find git files |
| `<leader>pws` | Grep word under cursor |
| `<leader>pWs` | Grep WORD under cursor |
| `<leader>ps` | Grep custom pattern |
| `<leader>vh` | Help tags |
| `<leader>nh` | Clear search highlights |

### File Operations

| Keybind | Action |
|---------|--------|
| `<leader>x` | Make current file executable |
| `<leader>nf` | Create new file (relative to current dir) |
| `<leader>nF` | Create new file (from project root) |
| `<leader>pr` | Open project root explorer |
| `<leader>tt` | Open terminal at project root |

### Git

| Keybind | Action |
|---------|--------|
| `<leader>lg` | Open LazyGit full interface |
| `<leader>lf` | LazyGit for current file |

### Other

| Keybind | Action |
|---------|--------|
| `<leader>u` | Toggle undo tree |
| `<leader>zig` | Restart LSP |
| `<leader>nh` | Clear search highlights |
| `<leader>+` | Increment number |
| `<leader>-` | Decrement number |
| `<leader><leader>` | Source current file |
| `<C-c>` | Escape from insert mode |
| `Q` | Disabled (no-op) |

### Quickfix Navigation

| Keybind | Action |
|---------|--------|
| `<C-k>` | Next quickfix item |
| `<C-j>` | Previous quickfix item |
| `<leader>k` | Next location list item |
| `<leader>j` | Previous location list item |

---

## Emmet (HTML/CSS Expansion)

### How to Use

1. Open an HTML, CSS, or JSX file
2. Type an emmet abbreviation
3. Press `<C-e>` to expand

### Examples

```
div.container       →  <div class="container"></div>
ul>li*3             →  <ul><li></li><li></li><li></li></ul>
form>input+button   →  <form><input><button></button></form>
img[src alt]        →  <img src="" alt="">
```

---

## Editor Settings

### Display

- **Line numbers**: Enabled (relative)
- **Tab size**: 3 spaces
- **Cursor line**: Horizontal line through cursor
- **Cursor column**: Vertical line through cursor
- **Color column**: Column 80 marker
- **Theme**: Strawberry Light (warm, light theme)

### Behavior

- **Clipboard**: Synced with system clipboard (`<leader>y` / `<leader>d`)
- **Smart indent**: Auto-indent on new lines
- **Search**: Case-insensitive (unless uppercase in query)
- **Split behavior**: New splits open to right/bottom
- **Undo**: Persistent across sessions (~/.vim/undodir)

---

## Common Tasks

### Install Language Servers

Language servers are auto-installed via Mason. To install additional ones:

```bash
# In Neovim
:Mason
```

Then search and install the server you need (e.g., `clangd`, `lua_ls`).

### Update Plugins

```bash
# In Neovim
:Lazy update
```

### Check Health

```bash
# In Neovim
:checkhealth
```

This shows any missing dependencies or configuration issues.

### Create a New Project File

- **Relative to current file**: `<leader>nf`
- **From project root**: `<leader>nF`

Then type the filename and press Enter.

---

## Troubleshooting

### Emmet not expanding

1. Make sure you're in an HTML/CSS/JSX file
2. Type an abbreviation (e.g., `div`)
3. Press `<C-e>`
4. Run `:Lazy` and verify emmet-vim is loaded

### File explorer not opening

- Press `<C-b>` to toggle nvim-tree
- Or use `<leader>pv` for netrw (built-in file browser)

### Git commands not working

Make sure `lazygit` is installed:
```bash
which lazygit
```

If not found, install: `sudo pacman -S lazygit`

### Colors look wrong

The theme is set to "strawberry-light" (light background). If colors seem off:

1. Verify your terminal supports true color
2. Run `:checkhealth` and look for "termguicolors"

### LSP not working

Run `:checkhealth vim.lsp` to see what's missing. Most likely you need to install language servers via `:Mason`.

---

## Quick Reference

**Leader Key**: Space (`<Space>`)

**Most Common Binds**:
- `<leader>pf` - Find files
- `<leader>ps` - Search text
- `<C-b>` - Toggle file tree
- `<leader>lg` - Open git UI
- `<leader>u` - Undo history
- `<C-e>` - Expand HTML/CSS

---

