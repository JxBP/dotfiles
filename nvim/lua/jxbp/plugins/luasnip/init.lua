-- Pretty much all of this is from https://github.com/arsham/shark/tree/master
-- with minor modifications. :D
return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")

        ls.add_snippets("all", require("jxbp.plugins.luasnip.all"))
        ls.add_snippets("go", require("jxbp.plugins.luasnip.go"))
        ls.add_snippets("markdown", require("jxbp.plugins.luasnip.markdown"))
        ls.add_snippets("rust", require("jxbp.plugins.luasnip.rust"))

        ls.config.set_config({
            store_selection_keys = "<c-s>",
            updateevents = "TextChanged,TextChangedI",
            ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype,
        })
    end,
    lazy = true,
}
