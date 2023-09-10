-- =============================================================================
-- Vim Saver (Lua part)
-- An auto-save functionality to save files with a delay.
-- =============================================================================

local M = {}  -- Module object

-- Default configuration
local config = {
    hold_for_ms = 1250,
    excluded_filetypes = {
        netrw           = true,
        startify        = true,
        NvimTree        = true,
        fugitive        = true,
        fugitiveblame   = true,
        gitcommit       = true,
        qf              = true,
        help            = true,
        undotree        = true,
        vista           = true,
        packer          = true,
        TelescopePrompt = true,
    }
}

local save_timer = nil  -- Timer object for the delayed save

local function save_buffer()
    vim.cmd("update")
    vim.cmd("echohl Comment")
    vim.cmd([[echo "  -- auto-saved at " . strftime('%H:%M:%S') ]])
    vim.cmd("echohl None")
end

M.on_save_event = function()
    local excluded = config.excluded_filetypes
    -- Skip auto-save for unnamed buffers or excluded filetypes
    if vim.fn.bufname("%") == "" or excluded[vim.bo.filetype] then
        return
    end

    if save_timer then
        -- Stop any ongoing timer
        vim.fn.timer_stop(save_timer)
    end

    -- Start a new timer for delayed save
    save_timer = vim.fn.timer_start(config.hold_for_ms, function(_)
        save_buffer()
    end)
end

-- Setup function for custom configurations
M.setup = function(params)
    config = vim.tbl_deep_extend("keep", params, config)
end

return M
