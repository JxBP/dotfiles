vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 24
vim.opt.autochdir = true
vim.opt.termguicolors = true
vim.g.netrw_banner = 0

-- Custom options
vim.g.format_on_save = true
vim.g.jxbp_transparent_bg = false
vim.g.jxbp_colorscheme = "gruvbox-material"

if vim.g.neovide then
	vim.o.guifont = "Iosevka Nerd Font Mono:h12"
	vim.g.neovide_cursor_animation_length = 0.03
end
