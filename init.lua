vim.cmd("set shell=powershell.exe")
vim.cmd("set shellxquote=")
vim.cmd("let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '")
vim.cmd("let &shellquote   = ''")
vim.cmd("let &shellpipe    = '| Out-File -Encoding UTF8 %s'")
