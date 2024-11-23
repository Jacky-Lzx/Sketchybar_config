local colors = require("colors")

local paw = sbar.add("item", {
	width = 30,
	background = {
		color = colors.item_background,
	},
	icon = {
		drawing = "off",
	},
	label = {
		align = "center",
		string = "􀣺",
		-- font = settings.font.text .. ":Regular:16.0",
		color = colors.Catppuccin.Mocha.Green,
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
	align = "center",
})
