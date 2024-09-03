return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      -- colorscheme = "tokyonight",
    },
  },
  {
    "tokyonight.nvim",
    priority = 1000,
    opts = function()
      return {
        style = "moon",
        transparent_background = true,
        --transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
          comments = { italic = false },
          keywords = { italic = false },
          functions = { italic = false },
          variables = { italic = false },
        },
      }
    end,
  },
  {
    "catppuccin/nvim",
    opts = {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "mocha",
        dark = "latte",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.25, -- percentage of the shade to apply to the inactive window
      },
    },
  },
}
