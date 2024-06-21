-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "rose-pine",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        Normal = { bg = "none" },
        NotifyBackground = { bg = "#000000" },
        NotifyDEBUGBorder = { bg = "none", fg = "#FFFFFF" },
        NotifyINFOBorder = { bg = "none", fg = "#FFFFFF"  },
        NotifyWARNBorder = { bg = "none", fg = "#FFFFFF"  },
        NotifyERRORBorder = { bg = "none", fg = "#FFFFFF"  },
        NormalFloat = { bg = "none" },
        NormalNC = { bg = "none" },
        NormalSB = { bg = "none" },
        TelescopePromptNormal = { bg = "none" },
        TelescopeResultsNormal = { bg = "none" },
        TelescopeBorder = { bg = "none" },
        TelescopePreviewNormal = { bg = "none" },
        TelescopePromptBorder = { bg = "none" },
        TelescopeResultsBorder = { bg = "none" },
        TelescopePreviewBorder = { bg = "none" },
        CursorColumn = { bg = "none" },
        CursorLine = { bg = "none" },
        CursorLineNr = { bg = "none" },
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
