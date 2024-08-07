-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.color.nvim-highlight-colors" },
  { import = "astrocommunity.completion.copilot-cmp" },
  { import = "astrocommunity.completion.cmp-emoji" },
  { import = "astrocommunity.colorscheme.sonokai" },
  { import = "astrocommunity.git.diffview-nvim" },
}
