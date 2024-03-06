return {
  "crusj/structrue-go.nvim",
  event = "VimEnter",
  config = function ()
    require("structrue-go").setup()
  end,
}
