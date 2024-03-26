-- Powershell settings
vim.cmd("set shell=powershell.exe")
vim.cmd("set shellxquote=")
vim.cmd("let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '")
vim.cmd("let &shellquote   = ''")
vim.cmd("let &shellpipe    = '| Out-File -Encoding UTF8 %s'")

-- Mappings to get rid of "stuck" shift effect
vim.cmd("command! Q quit")
vim.cmd("command! Qa quitall")
vim.cmd("command! QA quitall")
vim.cmd("command! W write")

-- folding settings
vim.cmd("set nofoldenable")

-- set treesitter folding for every filtype that has a
-- treesitter parser
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt.foldmethod = "syntax"
    end
  end,
})

