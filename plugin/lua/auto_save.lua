local M = {}

local save_timer = nil

local function save_buffer()
    vim.cmd("update")
    vim.api.nvim_out_write("... AutoSaved at " .. os.date("%H:%M:%S") .. "\n")
end

M.auto_save = function()
    if save_timer then
        -- If there's an existing timer, stop it.
        vim.fn.timer_stop(save_timer)
    end

    save_timer = vim.fn.timer_start(1250, function()
        save_buffer()
        save_timer = nil
    end)
end

return M
