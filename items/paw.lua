local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.icon_map")

-- Padding item required because of bracket
-- sbar.add("item", { width = 8 })

local paw = sbar.add("item", {
	-- background = {
	-- 	align = "center",
	-- 	color = colors.tn_black3,
	-- 	border_width = 0,
	-- 	corner_radius = 6,
	-- 	height = 24,
	-- 	padding_left = 6,
	-- 	padding_right = 6,
	-- },
	icon = {
		drawing = "off",
	},
	label = {
		align = "center",
		string = "􀣺",
		font = settings.font.text .. ":Regular:16.0",
		-- somehow icon is not centered, add additional padding on left
		-- padding_left = 1,
		-- padding_right = 1,
		color = colors.green
		-- background = {
		-- 	color = colors.tmux_white,
		-- 	padding_left = 0,
		-- 	padding_right = 0,
		-- },
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
	align = "center",
})

-- sbar.add("bracket", { paw.name }, {
-- 	background = {
-- 		color = colors.tn_black3,
-- 		border_color = colors.cmap_1,
-- 		corner_radius = 10,
-- 		padding_left = 0,
-- 		padding_right = 0,
-- 	},
-- })
--
-- -- Padding item required because of bracket
-- sbar.add("item", { width = 6 })
