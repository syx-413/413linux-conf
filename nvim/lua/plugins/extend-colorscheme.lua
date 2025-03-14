return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- require("github-theme").load()
        require("bamboo").load()
        -- require("catppuccin").load()
      end,
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      color_overrides = {
        mocha = {
          base = "#000000",
        },
      },
      background = { -- :h background
        light = "mocha",
        dark = "latte",
      },
      highlight_overrides = {
        mocha = function(mocha)
          return {
            NvimTreeNormal = { bg = mocha.none },
          }
        end,
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    --
    -- keys = {
    --   {
    --     "<leader>tt",
    --     function()
    --       local cat = require("catppuccin")
    --       cat.options.transparent_background = not cat.options.transparent_background
    --       cat.compile()
    --       vim.cmd.colorscheme(vim.g.colors_name)
    --     end,
    --     desc = "Catppuccin Transparent Background",
    --   },
    -- },
  },
  -- Using lazy.nvim
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    priority = 1000,
    -- name = "bamboo",
    opts = {
      -- Main options --
      -- NOTE: to use the light theme, set `vim.o.background = 'light'`
      style = "multiplex", -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
      toggle_style_key = nil, -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
      toggle_style_list = { "vulgaris", "multiplex", "dark" }, -- List of styles to toggle between
      transparent = true, -- Show/hide background

      dim_inactive = false, -- Dim inactive windows/buffers
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
      -- cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
      -- Change code style ---
      -- Options are anything that can be passed to the `vim.api.nvim_set_hl` table
      -- You can also configure styles with a string, e.g. keywords = 'italic,bold'
      code_style = {
        comments = { italic = true },
        conditionals = { italic = true },
        keywords = {},
        functions = {},
        namespaces = { italic = true },
        parameters = { italic = true },
        strings = {},
        variables = {},
      },
      -- Lualine options --
      lualine = {
        transparent = true, -- lualine center bar transparency
      },
      -- Custom Highlights --
      -- colors = {
      --   bright_black = "#000020", -- define a new color
      --   -- green = "#00ffaa", -- redefine an existing color
      -- }, -- Override default colors
      -- highlights = { -- make comments blend nicely with background, similar to other color schemes
      --   ["@comment"] = { fg = "#85a91a" },
      --   --
      --   ["@keyword"] = { fg = "$green" },
      --   ["@string"] = { fg = "$bright_black", bg = "#9eaf58", fmt = "bold" },
      --   ["@function"] = { fg = "#0000ff", sp = "$yellow", fmt = "underline,italic" },
      --   ["@function.builtin"] = { fg = "#0059ff" },
      -- }, -- Override highlight groups
      -- Plugins Config --
      diagnostics = {
        darker = false, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    options = {
      -- Compiled file's destination location
      compile_path = vim.fn.stdpath("cache") .. "/github-theme",
      compile_file_suffix = "_compiled", -- Compiled file suffix
      hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
      hide_nc_statusline = true, -- Override the underline style for non-active statuslines
      transparent = true, -- Disable setting bg (make neovim's background transparent)
      terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      dim_inactive = false, -- Non focused panes set to alternative background
      module_default = true, -- Default enable value for modules
      styles = { -- Style to be applied to different syntax groups
        comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
        functions = "NONE",
        keywords = "NONE",
        variables = "NONE",
        conditionals = "NONE",
        constants = "NONE",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
      },
      inverse = { -- Inverse highlight for different types
        match_paren = false,
        visual = false,
        search = false,
      },
      darken = { -- Darken floating windows and sidebar-like windows
        floats = true,
        sidebars = {
          enable = true,
          list = {}, -- Apply dark background to specific windows
        },
      },
      modules = { -- List of various plugins and additional options
        -- ...
      },
    },
    palettes = {},
    specs = {},
    groups = {},
  },
}
