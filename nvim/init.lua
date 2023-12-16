-- This needs to be done before lazy.nvim
vim.g.mapleader = " "

-- Global vim settings
require("jxbp.settings")

-- Bootstrap lazy.nvim
require("jxbp.lazy")

-- Key mappings
require("jxbp.remap")
