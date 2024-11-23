local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

----------------------------------------------------------------------------------------------------
----                                          memory                                            ----
----------------------------------------------------------------------------------------------------
-- Execute the event provider binary which provides the event "memory_update" for
-- the memory load data, which is fired every 1.0 second.
sbar.exec(
  "killall memory_load >/dev/null; $CONFIG_DIR/helpers/event_providers/memory_load/bin/memory_load memory_update 1.0"
)

local memory = sbar.add("item", "widgets.memory", {
  position = "e",
  background = {
    height = 22,
    color = { alpha = 0 },
    border_color = { alpha = 0 },
    drawing = true,
  },
  icon = {
    string = icons.memory,
    font = { size = 23 },
    color = colors.pure_green,
  },
  label = {
    string = "??%",
    color = colors.pure_green,
    font = {
      family = settings.font.numbers,
      -- style = settings.font.style_map["Bold"],
    },
    align = "right",
  },
  padding_right = 0,
  padding_left = 5,
})

memory:subscribe("memory_update", function(env)
  -- Fetch the used memory percentage from the event provider
  local used_percentage = tonumber(env.used_percentage)
  if used_percentage == nil then
    used_percentage = -1
  end

  local alpha = 0.4
  local color = colors.pure_green
  local fill_color = colors.with_alpha(colors.pure_green, alpha)
  if used_percentage > 30 then
    if used_percentage < 60 then
      color = colors.yellow
      fill_color = colors.with_alpha(colors.yellow, alpha)
    elseif used_percentage < 80 then
      color = colors.orange
      fill_color = colors.with_alpha(colors.orange, alpha)
    else
      color = colors.red
      fill_color = colors.with_alpha(colors.red, alpha)
    end
  end

  memory:set({
    label = {
      string = string.format("%d", math.floor(used_percentage)) .. "%",
      color = color,
    },

    icon = { color = color },
  })
  -- bracket:set({ background = { border_color = color } })
end)

memory:subscribe("mouse.clicked", function(env)
  sbar.exec("open -a 'Activity Monitor'")
end)

return memory
