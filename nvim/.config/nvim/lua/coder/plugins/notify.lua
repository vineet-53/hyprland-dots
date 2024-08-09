return {
  "rcarriga/nvim-notify",
  enabled = false,
  opts = {
    timeout = 3000,
    background_colour = "#000000",
    render = "minimal",
    fps = 60,
    stages = "fade",
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
  end,
}
