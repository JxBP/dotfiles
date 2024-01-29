return {
    {
        'rmagatti/auto-session',
        opts = {
            auto_session_use_git_branch = true
        },
        config = true,
        keys = {
            {
                "<leader>S",
                function()
                    require("auto-session.session-lens").search_session()
                end,
                desc = "Sessions"
            }
        }
    }
}
