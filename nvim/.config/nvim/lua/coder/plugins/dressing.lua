return {
  "stevearc/dressing.nvim",
  lazy = true,
  opts = nil,
  config = function (_ , opts)
    require('dressing').setup(opts)
  end
}
