-- print "setting concealer"
vim.opt.highlight.Conceal = { gui = "bold" }
vim.cmd "highlight Conceal gui=bold"
vim.cmd "highlight @markup.link.url cterm=underline gui=underline"
