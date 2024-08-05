-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "mrjones2014/smart-splits.nvim",
    event = "BufRead", -- load on very lazy for mux detection
  }
}
