local colors = require("colors")
local app_icons = require("helpers.icon_map")

function parse_string_to_table(s)
	local result = {}
	for line in s:gmatch("([^\n]+)") do
		table.insert(result, line)
	end
	return result
end

local file = io.popen("aerospace list-workspaces --all")
local result = file:read("*a")
file:close()

-- local workspace

local workspaces = parse_string_to_table(result)
for i, workspace in ipairs(workspaces) do
	local space = sbar.add("item", "space." .. i, {
		icon = {
			string = workspace,
			color = colors.white,
			highlight_color = colors.red,
		},
		label = { drawing = false },
		padding_left = 1,
		padding_right = 1,
	})

	space:subscribe("aerospace_workspace_change", function(env)
		local selected = env.FOCUSED_WORKSPACE == workspace
		space:set({
			icon = { highlight = selected },
			label = { highlight = selected },
			background = { border_color = selected and colors.white or colors.bg2 },
		})
	end)
end

local space_window_observer = sbar.add("item", {
	drawing = false,
	updates = true,
})

space_window_observer:subscribe("aerospace_focus_change", function()
	sbar.exec("aerospace list-windows --workspace focused --format '%{app-name}' --json ", function(apps)
		local icon_line = ""
		local no_app = true
		for i, app in ipairs(apps) do
			no_app = false
			local app_name = app["app-name"]
			local lookup = app_icons[app_name]
			local icon = ((lookup == nil) and app_icons["Default"] or lookup)
			icon_line = icon_line .. " " .. icon
		end

		if no_app then
			icon_line = " —"
		end

		sbar.animate("tanh", 10, function()
			workspace:set({ label = icon_line })
		end)
	end)
end)
