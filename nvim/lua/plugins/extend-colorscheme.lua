return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("catppuccin").load()
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
    keys = {
      {
        "<leader>tt",
        function()
          local cat = require("catppuccin")
          cat.options.transparent_background = not cat.options.transparent_background
          cat.compile()
          vim.cmd.colorscheme(vim.g.colors_name)
        end,
        desc = "Toggle Catppuccin Transparent Background",
      },
    },
  },
}
