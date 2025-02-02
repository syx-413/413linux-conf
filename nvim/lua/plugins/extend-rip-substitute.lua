return {
  "chrisgrieser/nvim-rip-substitute",
  event = "VeryLazy",
  keys = {
    {
      "g/",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      desc = "Rip Substitute",
    },
  },
}
