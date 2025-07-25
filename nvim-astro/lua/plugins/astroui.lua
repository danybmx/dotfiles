-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "ayu",
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      highlights = {
        -- set highlights for all themes
        -- use a function override to let us use lua to retrieve
        -- colors from highlight group there is no default table
        -- so we don't need to put a parameter for this function
        init = {
          -- Normal
          Normal = { bg = "none" },
          SignColumn = { bg = "none" },
          FoldColumn = { bg = "none" },
          NormalFloat = { bg = "none" },
          NormalNC = { bg = "none" },
          NormalSB = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { fg = "#F2F3F5", bg = "none" },
          -- WinBar
          WinBar = { bg = "none" },
          WinSeparator = { fg = "#F2F3F5", bg = "none" },
          WinBarNC = { bg = "none" },
          WhichKeyFloat = { bg = "none" },
          -- Telescope
          TelescopeBorder = { bg = "none" },
          TelescopePromptTitle = { bg = "none" },
          TelescopePromptBorder = { bg = "none" },
          TelescopeNormal = { bg = "none" },
          -- Diagnosis
          DiagnosticVirtualTextHint = { fg = "#F2F3F5", bg = "none" },
          DiagnosticVirtualTextWarn = { fg = "#e0af68", bg = "none" },
          DiagnosticVirtualTextInfo = { fg = "#9ece6a", bg = "none" },
          DiagnosticVirtualTextError = { fg = "#bd2c00", bg = "none" },
          -- NeoTree
          NeoTreeNormal = { bg = "none" },
          NeoTreeNormalNC = { bg = "none" },
          NeoTreeTabInactive = { bg = "none" },
          NeoTreeTabSeperatorActive = { fg = "#F2F3F5", bg = "none" },
          NeoTreeTabSeperatorInactive = { fg = "#F2F3F5", bg = "none" },
          NvimTreeTabSeperatorActive = { fg = "#F2F3F5", bg = "none" },
          NvimTreeTabSeperatorInactive = { fg = "#F2F3F5", bg = "none" },
          MiniTabLineFill = { fg = "#F2F3F5", bg = "none" },
          -- Spectre
          DiffChange = { fg = "#F2F3F5", bg = "#050a30" },
          DiffDelete = { fg = "#F2F3F5", bg = "#bd2c00" },
          -- StatusLine
          StatusLine = { fg = "#F2F3F5", bg = "none" },
          StatusLineNC = { fg = "#F2F3F5", bg = "none" },
          StatusLineTerm = { fg = "#F2F3F5", bg = "none" },
          StatusLineTermNC = { fg = "#F2F3F5", bg = "none" },
          VertSplit = { fg = "#F2F3F5", bg = "none" },
          -- QuickFixLine
          QuickFixLine = { bg = "none" },
          -- TabLine
          TabLine = { bg = "none" },
          TabLineSel = { bg = "none" },
          TabLineFill = { bg = "none" },
          -- Cursor
          CursorLineNr = { bg = "none" },
          CursorLine = { bg = "none" },
          ColorColumn = { bg = "none" },
          -- Search
          Search = { fg = "red" },
          IncSearch = { fg = "red" },
          -- Pmenu
          -- Pmenu = { bg = "none" },
          -- PmenuSel = { bg = "none" },
          -- PmenuSbar = { bg = "none" },
          -- PmenuThumb = { bg = "none" },
          -- Notifications
          NotifyINFOBody = { bg = "none" },
          NotifyWARNBody = { bg = "none" },
          NotifyERRORBody = { bg = "none" },
          NotifyDEBUGBody = { bg = "none" },
          NotifyTRACEBody = { bg = "none" },
          NotifyINFOBorder = { bg = "none" },
          NotifyWARNBorder = { bg = "none" },
          NotifyERRORBorder = { bg = "none" },
          NotifyDEBUGBorder = { bg = "none" },
          NotifyTRACEBorder = { bg = "none" },
          NotifyBackground = { bg = "#000000" },
        },
        -- init = function()
        --   local get_hlgroup = require("astroui").get_hlgroup
        --   -- get highlights from highlight groups
        --   local normal = get_hlgroup "Normal"
        --   local fg, bg = normal.fg, normal.bg
        --   local bg_alt = get_hlgroup("Visual").bg
        --   local green = get_hlgroup("String").fg
        --   local red = get_hlgroup("Error").fg
        -- return a table of highlights for telescope based on
        -- colors gotten from highlight groups
        -- return {
        --   TelescopeBorder = { fg = bg_alt, bg = bg },
        --   TelescopeNormal = { bg = bg },
        --   TelescopePreviewBorder = { fg = bg, bg = bg },
        --   TelescopePreviewNormal = { bg = bg },
        --   TelescopePreviewTitle = { fg = bg, bg = green },
        --   TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
        --   TelescopePromptNormal = { fg = fg, bg = bg_alt },
        --   TelescopePromptPrefix = { fg = red, bg = bg_alt },
        --   TelescopePromptTitle = { fg = bg, bg = red },
        --   TelescopeResultsBorder = { fg = bg, bg = bg },
        --   TelescopeResultsNormal = { bg = bg },
        --   TelescopeResultsTitle = { fg = bg, bg = bg },
        -- }
        -- end,
        astrodark = { -- a table of overrides/changes when applying the astrotheme theme
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
  },
}
