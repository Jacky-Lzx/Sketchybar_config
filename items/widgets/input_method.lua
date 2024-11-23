local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local input_method = sbar.add("item", "widgets.input_method", {
  position = "right",
  update_freq = 1,
  icon = {
    string = "󰘳",
    color = colors.yellow
  },
  background = {
    color = colors.Catppuccin.Mocha.Base
  }
})

local function udpate_input_method()
  sbar.exec(
    "defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' |sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/'",
    function(result, exit_code)
      if result == nil or result == '' then
        input_method:set({
          icon = {
            color = colors.Catppuccin.Mocha.Peach
          },
          label = {
            string = 'cn',
            color = colors.Catppuccin.Mocha.Peach
          }
        })
      else
        input_method:set({
          icon = {
            color = colors.Catppuccin.Mocha.Blue
          },
          label = {
            string = 'en',
            color = colors.Catppuccin.Mocha.Blue,
          }
        })
      end
    end)
end

input_method:subscribe("routine", udpate_input_method)
