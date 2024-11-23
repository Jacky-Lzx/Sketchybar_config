local colors = require("colors")
local app_icons = require("helpers.icon_map")

local nowplaying = sbar.add("item", "nowplaying", {
  position = "center",
  updates = true,
  update_freq = 1,
  icon = {
    font = "sketchybar-app-font:Regular:14.0",
    -- string = "􀑪",
    color = colors.Catppuccin.Mocha.Text
  },
  label = {
    max_chars = 50,
    align = "center",
  },
  background = {
    color = colors.Catppuccin.Mocha.Base
  }
})

local function update_music_info(env)
  local playing_state = env.INFO.state
  if playing_state == "paused" then
    nowplaying:set({
      drawing = false,
    })
    return
  end

  local app = env.INFO.app
  local title = env.INFO.title
  local artist = env.INFO.artist

  local result = title .. " - " .. artist
  local lookup = app_icons[app]
  local icon = ((lookup == nil) and app_icons["Default"] or lookup)
  if icon == nil then
    print("No icon for app: " .. app)
    icon = ""
  end

  nowplaying:set({
    drawing = true,
    icon = {
      string = icon
    },
    label = {
      string = result,
      color = colors.Catppuccin.Mocha.Text
    }
  })
end

nowplaying:subscribe({ "media_change" }, update_music_info)
