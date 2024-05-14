-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  { import = "astrocommunity.colorscheme.night-owl-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.fugit2-nvim" },
}
