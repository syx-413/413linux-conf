return {

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- if vim.o.background == "light" then
        --   vim.g.catppuccin_transparent_background = true
        -- else
        --   vim.g.catppuccin_transparent_background = false
        -- end
        require("catppuccin").load()
      end,
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "frappe",
        dark = "mocha",
        color_overrides = {
          latte = {
            rosewater = "#dc8a78",
            flamingo = "#dd7878",
            pink = "#ea76cb",
            mauve = "#8839ef",
            red = "#d20f39",
            maroon = "#e64553",
            peach = "#fe640b",
            yellow = "#df8e1d",
            green = "#40a02b",
            teal = "#179299",
            sky = "#04a5e5",
            sapphire = "#209fb5",
            blue = "#1e66f5",
            lavender = "#2ac1ec",
            text = "#ec73cd",
            subtext1 = "#5c5f77",
            subtext0 = "#6c6f85",
            overlay2 = "#7c7f93",
            overlay1 = "#8c8fa1",
            overlay0 = "#9ca0b0",
            surface2 = "#acb0be",
            surface1 = "#bcc0cc",
            surface0 = "#ccd0da",
            base = "#eff1f5",
            mantle = "#e6e9ef",
            crust = "#dce0e8",
          },
        },
      },
      -- 移除全局的 transparent_background 设置
      -- transparent_background = true,
      -- opts = {
      --   color_overrides = {
      --     mocha = {
      --       base = "#000000",
      --       -- base = "#060b16",
      --       mantle = "#090f1d",
      --       crust = "#0b1625",
      --     },
      --   },
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
