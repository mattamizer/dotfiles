-- Catppuccin Theme
return {
  -- https://github.com/catppuccin/nvim
  "catppuccin/nvim",
  name = "catppuccin", -- name is needed otherwise plugin shows up as "nvim" due to github URI
  lazy = false,        -- We want the colorscheme to load immediately when starting Neovim
  priority = 1000,     -- Load the colorscheme before other non-lazy-loaded plugins
  opts = {
    --   -- Replace this with your scheme-specific settings or remove to use the defaults
    -- transparent = true,
    flavour = "macchiato", -- "latte, frappe, macchiato, mocha"
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      dashboard = true,
      markdown = true,
      dap = true,
      dap_ui = true,
      telescope = { enabled = true },
      rainbow_delimiters = true
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts) -- Replace this with your favorite colorscheme
    vim.cmd("colorscheme catppuccin") -- Replace this with your favorite colorscheme
  end
}
