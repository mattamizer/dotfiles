local toggle_key = "<C-,>"

return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	keys = {
		{ toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code", mode = { "n", "x" } },
	},
	opts = {
		terminal = {
			---@module "snacks"
			---@type snacks.win.Config|{}
			snacks_win_opts = {
				position = "float",
				width = 0.85,
				height = 0.85,
				border = "rounded",
				keys = {
					claude_hide = {
						toggle_key,
						function(self)
							local float = self.win
							self:hide()
							-- claudecode.nvim only steps out of the hidden float via `wincmd p`,
							-- which silently fails when there is no previous window. Fall back to
							-- any normal window so focus never stays in the hidden terminal.
							if float and vim.api.nvim_get_current_win() == float then
								vim.cmd.stopinsert()
								for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
									local cfg = vim.api.nvim_win_get_config(win)
									if win ~= float and cfg.relative == "" and cfg.focusable ~= false then
										vim.api.nvim_set_current_win(win)
										break
									end
								end
							end
						end,
						mode = "t",
						desc = "Hide",
					},
				},
			},
		},
	},
}
