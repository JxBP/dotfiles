-- Pretty much all of this is from https://github.com/arsham/shark/tree/master
-- with minor modifications. :D
return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")
        require("luasnip.loaders.from_lua").lazy_load({
            paths = os.getenv("HOME") .. "/.config/nvim/snippets/"
        })

        ls.config.set_config({
            store_selection_keys = "<c-s>",
            updateevents = "TextChanged,TextChangedI",
            ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype,
        })
    end,
    lazy = true,
}
