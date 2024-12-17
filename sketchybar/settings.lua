return {
	paddings = 3,
	group_paddings = 5,

	icons = "NerdFont", -- alternatively available: sf-symbols

	-- This is a font configuration for SF Pro and SF Mono (installed manually)
	-- font = require("helpers.default_font"),

	font = {
		text = "Iosevka Nerd Font", -- Used for text
		numbers = "Iosevka Nerd Font", -- Used for numbers
		style_map = {
			["Regular"] = "Regular",
			["Semibold"] = "Medium",
			["Bold"] = "SemiBold",
			["Heavy"] = "Bold",
			["Black"] = "ExtraBold",
		},
	},
}
