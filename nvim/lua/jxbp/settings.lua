vim.opt.nu = true
vim.opt.signcolumn = "yes"
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
vim.opt.cursorline = true
vim.opt.lazyredraw = true
vim.g.netrw_banner = 0
vim.opt.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} "
-- vim.opt.cmdheight = 0

-- Custom options
vim.g.jxbp_format_on_save = true

if vim.g.neovide then
    vim.o.guifont = "Iosevka Nerd Font Mono:h12"
    vim.g.neovide_cursor_animation_length = 0.03
end

vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
    vim.g.jxbp_format_on_save = not vim.g.jxbp_format_on_save
end, {})

-- Go to our workspace root if the LSP gives us one
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(_)
        local dir = vim.lsp.buf.list_workspace_folders()[1]
        if dir then
            vim.opt.autochdir = false
            vim.api.nvim_set_current_dir(dir)
        end
    end,
})
