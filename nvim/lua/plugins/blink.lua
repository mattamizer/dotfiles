return {
	"saghen/blink.cmp",
	optional = true,
	dependencies = { "giuxtaposition/blink-cmp-copilot" },
	opts = {
		sources = {
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					kind = "Copilot",
					score_offset = 100,
					async = true,
				},
			},
		},
	},
}
