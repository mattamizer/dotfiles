require("lazy").setup({
  "christoomey/vim-tmux-navigator",
  "folke/neodev.nvim",
  "lewis6991/gitsigns.nvim",
  "mfussenegger/nvim-jdtls",
  "nvim-lualine/lualine.nvim",
  "preservim/vimux",
  "stevearc/oil.nvim",
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "vim-test/vim-test",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "windwp/nvim-autopairs",
  -- completion
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "github/copilot.vim",
  "neovim/nvim-lspconfig",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {'akinsho/bufferline.nvim', version = "v4.*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {}
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet engine & associated nvim-cmp source
      -- https://github.com/L3MON4D3/LuaSnip
      'L3MON4D3/LuaSnip',
      -- https://github.com/saadparwaiz1/cmp_luasnip
      'saadparwaiz1/cmp_luasnip',
      -- LSP completion capabilities
      -- https://github.com/hrsh7th/cmp-nvim-lsp
      'hrsh7th/cmp-nvim-lsp',
      -- Additional user-friendly snippets
      -- https://github.com/rafamadriz/friendly-snippets
      'rafamadriz/friendly-snippets',
      -- https://github.com/hrsh7th/cmp-buffer
      'hrsh7th/cmp-buffer',
      -- https://github.com/hrsh7th/cmp-path
      'hrsh7th/cmp-path',
      -- https://github.com/hrsh7th/cmp-cmdline
      'hrsh7th/cmp-cmdline',
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      -- https://github.com/mfussenegger/nvim-dap
      'mfussenegger/nvim-dap',
      -- https://github.com/theHamsta/nvim-dap-virtual-text
      'theHamsta/nvim-dap-virtual-text',   -- inline variable text while debugging
      -- https://github.com/nvim-telescope/telescope-dap.nvim
      'nvim-telescope/telescope-dap.nvim', -- telescope integration with dap
    }
  },
  {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim",
      {
        -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  }
})
