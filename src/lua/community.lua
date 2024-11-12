-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.colorscheme.catppuccin" },

  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },

  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },

  { import = "astrocommunity.git.diffview-nvim" },

  { import = "astrocommunity.lsp.garbage-day-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },

  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },

  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.clojure" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.zig" },

  { import = "astrocommunity.register.nvim-neoclip-lua" },

  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
}
