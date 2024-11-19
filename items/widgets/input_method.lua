local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local input_method = sbar.add("item", "widgets.input_method", {
  position = "right",
  update_freq = 1,
})

local function udpate_input_method()
  sbar.exec(
    "defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' |sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/'",
    function(result, exit_code)
      if result == nil or result == '' then
        input_method:set({
          icon = {
            string = "󰘳",
            drawing = "on",
            color = colors.yellow
          },
          label = {
            string = 'cn',
            color = colors.yellow
          }
        })
      else
        input_method:set({
          icon = {
            drawing = "off",
          },
          label = {
            string = 'en',
            color = colors.tn_blue,
          }
        })
      end
    end)
end

input_method:subscribe("routine", udpate_input_method)
