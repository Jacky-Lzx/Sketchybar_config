local colors = require("colors")

local cpu = require("items.widgets.system.cpu")
local memory = require("items.widgets.system.memory")
local wifi_bracket = require("items.widgets.system.wifi")

----------------------------------------------------------------------------------------------------
----                                         system bracket                                     ----
----------------------------------------------------------------------------------------------------

-- Not working
-- sbar.move(cpu.name, "before", wifi.name)

sbar.add("bracket", "widgets.system.bracket", {
  cpu.name,
  memory.name,
  wifi_bracket.name,
}, {
  background = {
    color = colors.Catppuccin.Mocha.Base
  },
})
