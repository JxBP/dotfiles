-- Suppress a warning with null-ls and clang-format
--[[
local old_notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
]]
