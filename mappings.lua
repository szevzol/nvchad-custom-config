local M = {}

M.abc = {
  n = {
    ["<leader>op"] = { "<cmd> Telescope neovim-project history<CR>", "Open recent project" },
    ["<leader>fp"] = { "<cmd> Telescope neovim-project discover<CR>", "Discover projects" },
    ["<leader>ft"] = { "<cmd> Telescope tags<CR>", "Find in tags" },
    ["<leader>fg"] = { "<cmd> lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Live grep with glob" },
    ["<leader>X"]  = { "<cmd> lua require(\"nvchad.tabufline\").closeAllBufs()<CR>", "Close all buffers" },
  },
}

return M
