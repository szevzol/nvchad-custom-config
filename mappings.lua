local M = {}

M.abc = {
  n = {
    ["<leader>op"] = { "<cmd> Telescope neovim-project history<CR>", "Open recent project" },
    ["<leader>fp"] = { "<cmd> Telescope neovim-project discover<CR>", "Discover projects" },
    ["<leader>ft"] = { "<cmd> Telescope tags<CR>", "Find in tags" },
    ["<leader>fg"] = { "<cmd> lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Live grep with glob" },
    ["<leader>X"]  = { "<cmd> lua require(\"nvchad.tabufline\").closeAllBufs()<CR>", "Close all buffers" },
    ["<F5>"]       = { "<cmd> lua require(\"dap\").continue()<CR>", "Start debugger / continue" },
    ["<F6>"]       = { "<cmd> lua require(\"dap\").step_over()<CR>", "Step over" },
    ["<F7>"]       = { "<cmd> lua require(\"dap\").step_into()<CR>", "Step into" },
    ["<F8>"]       = { "<cmd> lua require(\"dap\").step_out()<CR>", "Step out" },
    ["<leader>db"] = { "<cmd> lua require(\"dap\").toggle_breakpoint()<CR>", "Toggle breakpoint" },
    ["<leader>u"]  = { "<cmd> URLOpenUnderCursor<CR>", "Open URL under cursor" }
  },
}

return M
