# nixvim setup

## TODO

[ ](#configure-which-keys)
[x](#markdown-lsp)
[ ](#configure-plugins-from-astronvim)
[x](#configure-telescope)

## Details

### configure which-key

#### [ ] top level

    K - vim.lsp.buf.hover()
    0 - start of line

#### [ ] <leader>

    c - close buffer
    C - force close buffer
    e - toggle explorer
    n - new file
    o - toggle explorer focus
    q - delete current buffer
    Q - exit nvim
    w - save current buffer
    / - toggle comment line
    b - buffers submenu
    d - debugger submenu
    f - find submenu
    g - git submenu
    l - language tools submenu
    s - session submenu
    t - terminal submenu
    u - UI/UX submenu
    x - Quickfix/Lists submenu

#### [ ] <leader> + b - buffers submenu

    b - select buffer from Tabline
    c - close all buffers except current
    C - close all buffers
    d - close buffer from Tabline
    D - pick to close
    l - close all buffers to the left
    p - goto previous buffer
    r - close all buffers to the right
    \ - horizontal split buffer from tabline
    _ - vertical split buffer from tabline
    s - sort buffers

#### [ ] <leader> + d - debugger submenu

    b - toggle breakpoint
    B - clear breakpoints
    c - start/continue
    C - conditional breakpoint
    E - evaluate input
    h - debugger hover
    i - step into
    o - step over
    O - step out
    p - pause
    q - close session
    Q - terminate session
    r - restart
    R - toggle REPL
    s - run to cursor
    u - toggle debugger UI

#### [ ] <leader> + f - find submenu

    b - find buffers
    c - find word under cursor
    C - find commands
    f - find files
    F - find all files
    g - find git files
    h - find help
    k - find keymaps
    m - find man
    n - find notifications
    o - find history
    r - find registers
    t - find TODOs
    u - find undos
    w - find words
    W - find words in all files
    y - find yanks (neoclip)
    ' - find marks
    / - find words in current buffer
    <ENTER> - resume previous search

#### [ ] <leader> + g - git submenu

    b - git branches
    c - git commits (repository)
    C - git commits (current file)
    g - toggleterm Lazygit
    t - git status

#### [ ] <leader> + l - language tools submenu

    a - LSP code action
    A - LSP source action
    d - hover diagnostics
    D - search diagnostics
    f - format buffer
    i - LSP information
    r - rename current symbol
    R - search references
    s - search symbols
    S - symbols outline
    v - select virtualenv

#### [ ] <leader> + s - session submenu

    d - delete a session
    D - delete a dirsession
    f - load a session
    F - load a dirsession
    l - load last session
    s - save this session
    S - save this dirsession
    t - save this tab's session
    . - load current dirsession

#### [ ] <leader> + t - terminal submenu

    f - toggleterm float
    h - toggleterm horizontal split
    t - toggleterm btm
    u - toggleterm gdu
    v - toggleterm vertical split

#### [ ] <leader> + u - UI/UX submenu

    f - toggle autoformatting (buffer)
    F - toggle autoformatting (global)
    h - toggle LSP inlay hints (buffer)
    H - toggle LSP inlay hints (global)
    Y - toggle LSP semantic highlight (buffer)
    a - toggle autopairs
    A - toggle rooter autochdir
    c - toggle autocompletion (buffer)
    C - toggle autocompletion (global)
    d - toggle diagnostics
    D - toggle virtual diagnostic lines
    p - toggle paste mode
    r - toggle reference highlighting (buffer)
    R - toggle reference highlighting (global)
    w - toggle wrap
    y - toggle syntax highlight
    y - toggle syntax highlight
    z - toggle color highlight
    > - toggle foldcolumn
    | - toggle indent guides

#### [ ] <leader> + x - Quickfix/Lists submenu

    l - location list
    q - quickfix list

### markdown lsp

### configure plugins from astronvim

```
plugins = with pkgs.vimPlugins; [
  vimPlugins.nvim-treesitter.withAllGrammars
  vimPlugins.conjure

  # UI
  vimPlugins.catppuccin-nvim
  vimPlugins.comment-nvim # Contextual Commenting                                    DIFF
  vimPlugins.luasnip # Snippet Engine                                                UNSTABLE
  vimPlugins.nui-nvim # UI Component Library (for Neo-Tree)                          UNSTABLE
  vimPlugins.guess-indent-nvim # Automatic Indentation Detection
  vimPlugins.nvim-colorizer-lua # Highlight Color Strings
  vimPlugins.toggleterm-nvim # Terminal Management
  vimPlugins.bufdelete-nvim # Buffer Removal                                         DIFF
  vimPlugins.neoconf-nvim # Global and Project-local settings
  vimPlugins.neodev-nvim # Neovim Lua LSP Integration
  vimPlugins.which-key-nvim # Keymap Popup/Help Window
  vimPlugins.alpha-nvim # Dashboard/Homescreen
  vimPlugins.cmp-buffer # Completion of Buffer Words
  vimPlugins.cmp-nvim-lsp # Completion of LSP
  vimPlugins.cmp-path # Completion of Paths
  vimPlugins.nvim-cmp # Completion Engine                                            UNSTABLE
  vimPlugins.nvim-ufo # Fold detection
  vimPlugins.promise-async # Asynchronous Library (helper)
  vimPlugins.gitsigns-nvim # Buffer Git Integration                                  UNSTABLE
  vimPlugins.indent-blankline-nvim # Indent-level Indicators
  vimPlugins.nvim-dap # Debugger Adapter Protocol
  vimPlugins.smart-splits-nvim # Split Navigation and Multiplexer Integration
  vimPlugins.nvim-lspconfig # Language Server Configurations
  vimPlugins.comment-nvim # Comment Vim Operators
  vimPlugins.plenary-nvim # Lua Helper Functions (helper)                            UNSTABLE
  vimPlugins.neo-tree-nvim # File Explorer
  vimPlugins.telescope-fzf-native-nvim # Fast Telescope Sorter
  vimPlugins.telescope-nvim # General Finder/Picker                                  UNSTABLE
  vimPlugins.nvim-web-devicons # Filetype Icons
  # vimPlugins.nvim-treesitter-textobjects # Treesitter Vim Text Objects
  vimPlugins.none-ls-nvim # Formatter and Linter LSP Integration
  vimPlugins.lspkind-nvim # LSP Symbol Icons
  vimPlugins.friendly-snippets # General Purpose Snippet Collection
  vimPlugins.cmp-dap # Completion in DAP REPL
  vimPlugins.nvim-dap-ui # DAP User Interface
  vimPlugins.nvim-notify # UI Notification Pop-ups
  vimPlugins.heirline-nvim # Custom Statusline/Tabline/Winbar
  vimPlugins.nvim-window-picker # Window Picker (for Neo-tree)
  vimPlugins.cmp_luasnip # Completion of Snippets
  vimPlugins.aerial-nvim # Symbol Overview/Code Outline
  vimPlugins.dressing # General `vim.ui` Improvements
  vimPlugins.nvim-autopairs # Automatically Close Pairs
  vimPlugins.nvim-ts-autotag # Automatically Close/Rename Tags
];
```
