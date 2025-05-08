local wezterm = require("wezterm")
local act = wezterm.action
-- local mux = wezterm.mux
local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.enable_wayland = true
-- config.max_fps = 120
-- config.front_end = "WebGpu"

-- Settings
-- Dark_color_scheme = "rose-pine"
-- Light_color_scheme = "Raycast_Light"
-- for key, _ in pairs(wezterm.color.get_builtin_schemes()) do
-- 	print(key)
-- end
-- Dark_scheme = wezterm.color.get_builtin_schemes()[Dark_color_scheme]
-- Light_scheme = wezterm.color.get_builtin_schemes()[Light_color_scheme]
-- config.term="xterm-kitty"
config.enable_kitty_graphics=true
Light_scheme = require("cyberdream-light")
Dark_scheme = require("cyberdream")
-- scheme.background = "black"
-- scheme.ansi = {
-- 	"#1c1e1b",
-- 	"#e75a7c",
-- 	"#8fb573",
-- 	"#dbb671",
-- 	"#57a5e5",
-- 	"#aaaaff",
-- 	"#70c2be",
-- 	"#f1e9d2",
-- }
-- scheme.brights = {
-- 	"#f0c6c6",
-- 	"#f38ba8",
-- 	"#a6e3a1",
-- 	"#f9e2af",
-- 	"#89b4fa",
-- 	"#f5c2e7",
-- 	"#94e2d5",
-- 	"#a6adc8",
-- }
--#9ccfd8
--#31748F
-- Dark_scheme.brights = { "#9ccfd8", "#eb6f92", "#9ccfd8", "#f6c177", "#6f9eb1", "#c4a7e7", "#ebbcba", "#e0def4" }
-- Dark_scheme.ansi = {
-- 	"#26233a",
-- 	"#eb6f92",
-- 	"#9ccfd8",
-- 	"#f6c177",
-- 	"#31748f",
-- 	"#c4a7e7",
-- 	"#a285c6",
-- 	"#e0def4",
-- }
-- Dark_scheme.brights = { "#6e6a86", "#eb6f92", "#9ccfd8", "#f6c177", "#31748f", "#c4a7e7", "#ebbcba", "#e0def4" }
-- print(pairs(Dark_scheme))
-- Dark_scheme.brights[7] = "#9ccfd8"
-- Light_scheme.brights[1] = "#9ccfd8"
-- Dark_scheme.brights[1] = "#a285c6"
-- Light_scheme.brights[1] = "#a285c6"
-- Dark_scheme.background = "#222436"
-- Dark_scheme.foreground = "#cdd6f4"
config.color_schemes = {
	-- Override the builtin Gruvbox Light scheme with our modification.
	["mydark"] = Dark_scheme,

	-- We can also give it a different name if we don't want to override
	-- the default
	["mylight"] = Light_scheme,
}
config.color_scheme = "mydark"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
-- print("mycolor debug")
-- print(mycolors)
-- mycolors.background = "red"
-- config.color_scheme = "mycolors"
-- toggle light/dark scheme with CTRL+l
wezterm.on("toggle-dark-mode", function(window, pane)
	print("got event")
	print(config.color_scheme)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme == "mydark" then
		-- print("setting to light")
		overrides.color_scheme = "mylight"
	else
		-- print("setting to dark")
		overrides.color_scheme = "mydark"
	end
	window:set_config_overrides(overrides)
end)
config.font = wezterm.font_with_fallback({
	-- { family = "MonoLisa nh", scale = 1.15 },
	{ family = "MonoLisa script", scale = 1.15 },
	{ family = "JetbrainMono NerdFont", scale = 1.15 },
	{ family = "CaskaydiaCove Nerd Font", scale = 1.2 },
	{ family = "FantasqueSansM Nerd Font", scale = 1.2 },
})
config.window_background_opacity = 0.95
config.macos_window_background_blur = 70
local homedir = os.getenv("HOME")
-- config.window_background_image = homedir .. "/.config/wezterm/AutumnalPeachMatt.jpg"
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 30000
config.default_workspace = "home"

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}
-- config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
-- Keys
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send C-a when pressing C-a twice
	--
	{ key = "q", mods = "CTRL", action = wezterm.action({ EmitEvent = "toggle-dark-mode" }) },
	{ key = "a", mods = "LEADER", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	-- Pane keybindings
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- SHIFT is for when caps lock is on
	{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "s", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	-- We can make separate keybindings for resizing panes
	-- But Wezterm offers custom "mode" in the name of "KeyTable"
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- Tab keybindings
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
	-- Key table for moving tabs around
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },

	-- Lastly, workspace
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x1bOH" }),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x1bOF" }),
	},
}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- Tab bar
-- I don't like the look of "fancy" tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
-- wezterm.on("update-right-status", function(window, pane)
-- 	-- Workspace name
-- 	local stat = window:active_workspace()
--   local stat = windo:ho
-- 	-- It's a little silly to have workspace name all the time
-- 	-- Utilize this to display LDR or current key table name
-- 	if window:active_key_table() then
-- 		stat = window:active_key_table()
-- 	end
-- 	if window:leader_is_active() then
-- 		stat = "LDR"
-- 	end
wezterm.on("update-right-status", function(window, pane)
	-- Each element holds the text for a cell in a "powerline" style << fade
	local cells = {}

	-- Figure out the cwd and host of the current pane.
	-- This will pick up the hostname for the remote host if your
	-- shell is using OSC 7 on the remote host.
	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local cwd = ""
		local hostname = ""

		if type(cwd_uri) == "userdata" then
			-- Running on a newer version of wezterm and we have
			-- a URL object here, making this simple!

			cwd = cwd_uri.file_path
			hostname = cwd_uri.host or wezterm.hostname()
		else
			-- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
			-- which doesn't have the Url object
			cwd_uri = cwd_uri:sub(8)
			local slash = cwd_uri:find("/")
			if slash then
				hostname = cwd_uri:sub(1, slash - 1)
				-- and extract the cwd from the uri, decoding %-encoding
				cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
					return string.char(tonumber(hex, 16))
				end)
			end
		end

		-- Remove the domain name portion of the hostname
		local dot = hostname:find("[.]")
		if dot then
			hostname = hostname:sub(1, dot - 1)
		end
		if hostname == "" then
			hostname = wezterm.hostname()
		end

		-- table.insert(cells, cwd)
		-- table.insert(cells, hostname)
	end

	-- I like my date/time in this style: "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M")
	table.insert(cells, date)

	-- An entry for each battery (typically 0 or 1 battery)
	for _, b in ipairs(wezterm.battery_info()) do
		table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
	end

	-- The powerline < symbol
	local LEFT_ARROW = utf8.char(0xe0b3)
	-- The filled in variant of the < symbol
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- Color palette for the backgrounds of each cell
	local colors = {
		"#181825",
		"#181825",
		"#181825",
		"#181825",
		"#181825",
	}
	--
	-- Foreground color for the text across the fade
	local text_fg = "#cba6f7"

	-- The elements to be formatted
	local elements = {}
	-- How many cells have been formatted
	local num_cells = 0

	-- Translate a cell into elements
	function push(text, is_last)
		local cell_no = num_cells + 1
		table.insert(elements, { Foreground = { Color = text_fg } })
		table.insert(elements, { Background = { Color = colors[cell_no] } })
		table.insert(elements, { Text = " " .. text .. " " })
		if not is_last then
			table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
			-- table.insert(elements, { Text = SOLID_LEFT_ARROW })
		end
		num_cells = num_cells + 1
	end

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, #cells == 0)
	end

	window:set_right_status(wezterm.format(elements))
	-- Current working directory
	local basename = function(s)
		-- Nothign a little regex can't fix
		-- print("my s is", s)
		return string.gsub(tostring(s), "(.*[/\\])(.*)", "%2")
	end
	local cwd = basename(pane:get_current_working_dir())
	-- Current command
	local cmd = basename(pane:get_foreground_process_name())

	-- Time
	local time = wezterm.strftime("%H:%M")

	-- Let's add color to one of the components
	-- window:set_right_status(wezterm.format({
	-- 	-- Wezterm has a built-in nerd fonts
	-- 	{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
	-- 	{ Text = " | " },
	-- 	{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
	-- 	{ Text = " | " },
	-- 	{ Foreground = { Color = "FFB86C" } },
	-- 	{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
	-- 	"ResetAttributes",
	-- 	{ Text = " | " },
	-- 	{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
	-- 	{ Text = " |" },
	-- }))
end)
config.default_prog = { "zsh" }

return config
