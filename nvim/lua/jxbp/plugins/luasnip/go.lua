local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local util = require("jxbp.plugins.luasnip.util")
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial

local function not_in_function()
    return not util.is_in_function()
end

local in_test_func = {
    show_condition = util.is_in_test_function,
    condition = util.is_in_test_function,
}

local in_test_file = {
    show_condition = util.is_in_test_file,
    condition = util.is_in_test_file,
}

local in_func = {
    show_condition = util.is_in_function,
    condition = util.is_in_function,
}

local not_in_func = {
    show_condition = not_in_function,
    condition = not_in_function,
}

return {
    ls.s(
        { trig = "main", name = "Main", dscr = "Create a main function" },
        fmta("func main() {\n\t<>\n}", ls.i(0)),
        not_in_func
    ),

    ls.s(
        { trig = "ifcall", name = "IF CALL", dscr = "Call a function and check the error" },
        fmt(
            [[
        {val}, {err1} := {func}({args})
        if {err2} != nil {{
          return {err3}
        }}
        {finally}
      ]], {
                val     = ls.i(1, { "val" }),
                err1    = ls.i(2, { "err" }),
                func    = ls.i(3, { "Func" }),
                args    = ls.i(4),
                err2    = rep(2),
                err3    = ls.d(5, util.make_return_nodes, { 2 }),
                finally = ls.i(0),
            }),
        in_func
    ),

    ls.s(
        { trig = "fn", name = "Function", dscr = "Create a function or a method" },
        fmt(
            [[
        // {name1} {desc}
        func {rec}{name2}({args}) {ret} {{
          {finally}
        }}
      ]], {
                name1   = rep(2),
                desc    = ls.i(5, "description"),
                rec     = ls.c(1, {
                    ls.t(""),
                    ls.sn(nil, fmt("({} {}) ", {
                        ls.i(1, "r"),
                        ls.i(2, "receiver"),
                    })),
                }),
                name2   = ls.i(2, "Name"),
                args    = ls.i(3),
                ret     = ls.c(4, {
                    ls.i(1, "error"),
                    ls.sn(nil, fmt("({}, {}) ", {
                        ls.i(1, "ret"),
                        ls.i(2, "error"),
                    })),
                }),
                finally = ls.i(0),
            }),
        not_in_func
    ),

    ls.s(
        { trig = "ife", name = "If error", dscr = "If error, return wrapped" },
        fmt("if {} != nil {{\n\treturn {}\n}}\n{}", {
            ls.i(1, "err"),
            ls.d(2, util.make_return_nodes, { 1 }, { user_args = { { "a1", "a2" } } }),
            ls.i(0),
        }),
        in_func
    ),


    ls.s(
        { trig = "refrec", name = "Defer Recover", dscr = "Defer Recover" },
        fmta(
            [[
        defer func() {{
          if e := recover(); e != nil {{
            fmt.Printf("Panic: %v\n%v\n", e, string(debug.Stack()))
          }}
        }}()
      ]]
            , {}),
        in_func
    ),

    ls.s(
        { trig = "gerr", dscr = "Return an instrumented gRPC error" },
        fmt('internal.GrpcError({},\n\tcodes.{}, "{}", "{}", {})', {
            ls.i(1, "err"),
            ls.i(2, "Internal"),
            ls.i(3, "Description"),
            ls.i(4, "Field"),
            ls.i(5, "fields"),
        }),
        in_func
    ),

    ls.s(
        { trig = "make", name = "Make", dscr = "Allocate map or slice" },
        fmt("{} {}= make({})\n{}", {
            ls.i(1, "name"),
            ls.i(2),
            ls.c(3, {
                fmt("[]{}, {}", { ls.r(1, "type"), ls.i(2, "len") }),
                fmt("[]{}, 0, {}", { ls.r(1, "type"), ls.i(2, "len") }),
                fmt("map[{}]{}, {}", { ls.r(1, "type"), ls.i(2, "values"), ls.i(3, "len") }),
            }, {
                stored = { -- FIXME: the default value is not set.
                    type = ls.i(1, "type"),
                },
            }),
            ls.i(0),
        }),
        in_func
    ),

    ls.s(
        { trig = "tcs", dscr = "create test cases for testing" },
        fmta(
            [[
        tcs := map[string]struct {
        	<>
        } {
        	// Test cases here
        }
        for name, tc := range tcs {
        	tc := tc
        	t.Run(name, func(t *testing.T) {
        		<>
        	})
        }
      ]],
            { ls.i(1), ls.i(2) }
        ),
        in_test_func
    ),

    ls.s(
        { trig = "gocmp", dscr = "Create an if block comparing with cmp.Diff" },
        fmt(
            [[
        if diff := cmp.Diff({}, {}); diff != "" {{
        	t.Errorf("(-want +got):\\n%s", diff)
        }}
      ]], {
                ls.i(1, "want"),
                ls.i(2, "got"),
            }),
        in_test_func
    ),

    ls.s(
        { trig = "Test", name = "Test/Subtest", dscr = "Create subtests and their function stubs" },
        fmta("func <>(t *testing.T) {\n<>\n}\n\n <>", {
            ls.i(1),
            ls.d(2, util.create_t_run, ai({ 1 })),
            ls.d(3, util.mirror_t_run_funcs, ai({ 2 })),
        }),
        in_test_file
    ),
}
