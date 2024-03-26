local M = {}

M.abc = {
  n = {
    ["<leader>op"] = { "<cmd> Telescope neovim-project history<CR>", "Open recent project" },
    ["<leader>fp"] = { "<cmd> Telescope neovim-project discover<CR>", "Discover projects" },
    ["<leader>X"] = { "<cmd> lua require(\"nvchad.tabufline\").closeAllBufs()<CR>", "Close all buffers" },
  },
}

return M
