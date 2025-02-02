return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "VeryLazy",
    opts = {
      lazy_load = true,
      -- other setup options
      names = false,
      css = true,
    },
  },
  {
    {
      "uga-rosa/ccc.nvim",
      event = "VeryLazy",
      opts = { lazy_load = true },
    },
  },
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "hyprlang",
    },
  },
}
