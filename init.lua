-- Powershell settings
vim.cmd("set shell=pwsh.exe")
vim.cmd("set shellxquote=")
vim.cmd("let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '")
vim.cmd("let &shellquote   = ''")
vim.cmd("let &shellpipe    = '| Out-File -Encoding UTF8 %s'")

-- Jenkinsfile/groovy settings
vim.cmd("au BufNewFile,BufRead Jenkinsfile setf groovy")
vim.cmd("autocmd FileType groovy setlocal shiftwidth=4 softtabstop=4 expandtab")

-- posh-direnv syntax highlight
vim.cmd("au BufNewFile,BufRead .psenvrc setf ps1")


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

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
--vim.keymap.set('n', '<F5>', require 'nvim-dap'.continue)
-- vim.keymap.set('n', '<F10>', require 'dap'.step_over)
-- vim.keymap.set('n', '<F11>', require 'dap'.step_into)
-- vim.keymap.set('n', '<F12>', require 'dap'.step_out)
-- vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
