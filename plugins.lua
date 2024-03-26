local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "isort",
        "black",
        "markdownlint"
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
        python = { 'pylint' },
        markdown = { 'markdownlint' }
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
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    opts = function()
      local telescope = require("telescope")
      local lga_actions = require("telescope-live-grep-args.actions")

      telescope.setup {
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                ["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
              },
            },
          }
        }
      }
      require("telescope").load_extension("live_grep_args")
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "microsoft/debugpy"
    },
    init = function()
      require("dap-python").setup("python.exe")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    init = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    requires = { "mfussenegger/nvim-dap" },
  }
}
return plugins
