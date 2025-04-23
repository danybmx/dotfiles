return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = {
  --     transparent = true,
  --     style = "night",
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      enable = {
        legacy_highlights = false,
      },
      styles = {
        transpacency = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
