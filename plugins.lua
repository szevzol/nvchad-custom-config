local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "isort",
        "black"
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.conform"
    end
  },
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { 'pylint' }
      }
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "coffebar/neovim-project",
    opts = {
      last_session_on_startup = false,
      projects = { -- define project roots
        "~/DS-SCP*",
        -- "c:\\Users\\uif77145\\DS-SCP*",
        "~/projects/*"
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.

      require("nvim-tree").setup {
        -- git = {
        --  cygwin_support = true,
        -- }
      }
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },
  {
    "chentoast/marks.nvim",
    lazy = false,
    config = function()
      require("marks").setup {
        default_mappings = true,
        signs = true,
        mappings = {}
      }
    end
  },
}
return plugins
