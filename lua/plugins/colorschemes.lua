return {
  {
    "xiantang/darcula-dark.nvim",
    config = function()
      require("darcula").setup({
        override = function(c)
          return {
            dark = "#282c34"
          }
        end
      })
    end
  }

}
