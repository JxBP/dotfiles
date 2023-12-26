-- Pretty much all of this is from https://github.com/arsham/shark/tree/master
-- with minor modifications. :D
return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")
        local types = require("luasnip.util.types")

        ls.add_snippets("all", require("jxbp.plugins.luasnip.all"))
        ls.add_snippets("go", require("jxbp.plugins.luasnip.go"))
        ls.add_snippets("markdown", require("jxbp.plugins.luasnip.markdown"))
        ls.add_snippets("rust", require("jxbp.plugins.luasnip.rust"))

        ls.config.set_config({
            store_selection_keys = "<c-s>",
            updateevents = "TextChanged,TextChangedI",
            ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype,

            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { " ", "TSTextReference" } },
                    },
                },
                [types.insertNode] = {
                    active = {
                        virt_text = { { " ", "TSEmphasis" } },
                    },
                },
            },
        })
    end,
    lazy = true,
}
