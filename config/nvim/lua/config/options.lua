vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.relativenumber = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.g.lazyvim_prettier_needs_config = true
