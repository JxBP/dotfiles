-- Pretty much all of this is from https://github.com/arsham/shark/tree/master
-- with minor modifications. :D
return {
    "L3MON4D3/LuaSnip",
    keys = function()
        local ls = require("luasnip")
        return {
            {
                "<C-k>",
                function()
                    if ls.expand_or_jumpable() then
                        ls.expand_or_jump()
                    end
                end,
                mode = { "i", "s" },
                desc = "LuaSnip forward",
                silent = true,
            },
            {
                "<C-j>",
                function()
                    if ls.jumpable(-1) then
                        ls.jump(-1)
                    end
                end,
                mode = { "i", "s" },
                desc = "LuaSnip backward",
                silent = true
            },
            {
                "<C-l>",
                function()
                    if ls.choice_active() then
                        ls.change_choice(1)
                    end
                end,
                mode = { "i", "s" },
                desc = "LuaSnip alternative",
                silent = true
            }
        }
    end,
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
