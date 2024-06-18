-- Default configuration
local config = {
    active = true,
    short_debounce_ms = 987,
    long_debounce_ms = 4181,
}

local api = vim.api

-- private section
local timer = vim.loop.new_timer()
local is_counting = false
local augroup_id = nil

local function on_changed_events()
    if is_counting then
        timer:stop()
    else
        is_counting = true
    end

    timer:start(config.long_debounce_ms, 0, vim.schedule_wrap(function()
        vim.cmd("update")
        is_counting = false
    end))
end

local function on_change_leave_events()
    if is_counting then
        timer:stop()
    else
        is_counting = true
    end

    timer:start(config.short_debounce_ms, 0, vim.schedule_wrap(function()
        vim.cmd("update")
        is_counting = false
    end))
end

local function on_leave_events()
    if is_counting then
        timer:stop()
        is_counting = false
    end
    -- Check the buffer type before running the update command
    local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
    if buftype == '' then
        vim.cmd("update")
    else
        print("Skipping update for buffer type: " .. buftype)
    end
end

local function subscribe()
    augroup_id = api.nvim_create_augroup("SaverEvents", { clear = true })
    -- create all autocmds
    api.nvim_create_autocmd(
        {
            "FocusLost",
            "BufLeave",
        },
        {
            pattern = "*",
            callback = function(event)
                if event.file ~= "" and not vim.bo.readonly and vim.bo.modified then
                    on_leave_events()
                end
            end
        }
    )
    api.nvim_create_autocmd(
        {
            "TextChanged",
        },
        {
            pattern = "*",
            callback = function(event)
                if event.file ~= "" and not vim.bo.readonly and vim.bo.modified then
                    on_changed_events()
                end
            end
        }
    )
    api.nvim_create_autocmd(
        {
            "InsertLeave",
        },
        {
            pattern = "*",
            callback = function(event)
                if event.file ~= "" and not vim.bo.readonly and vim.bo.modified then
                    on_change_leave_events()
                end
            end
        }
    )
end

local function unsubscribe()
    -- first, stop anything in progress
    if is_counting then
        timer:stop()
        is_counting = false
    end
    -- second, clear all the autocmds
    if augroup_id ~= nil then
        api.nvim_del_augroup_by_id(augroup_id)
        augroup_id = nil
    end
end

-- public section
local M = {}

M.toggle = function()
    config.active = not config.active

    if config.active then
        subscribe()
    else
        unsubscribe()
    end

    print("VimSaver was", config.active and "activated." or "deactivated.")
end

M.setup = function(user_options)
    config = vim.tbl_deep_extend("keep", user_options, config)
    api.nvim_create_user_command("SaverToggle", M.toggle, { force = true })
    if config.active then
        subscribe()
    end
end

return M
