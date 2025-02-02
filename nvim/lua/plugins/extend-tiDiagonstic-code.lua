-- -- 行内提示优化插件，只有当聚焦到当前行才会显示全部提示且支持换行显示
return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    opts = {},
    preset = "modern",

    transparent_bg = true, -- Set the background of the diagnostic to transparent
    multilines = {
      -- Enable multiline diagnostic messages
      enabled = true,

      -- Always show messages on all lines for multiline diagnostics
      always_show = false,
    },
  },
}
