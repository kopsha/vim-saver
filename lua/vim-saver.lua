-- Default configuration
local config = {
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
    },
    inactive = false,
}

local function save_buffer(bufname)
    vim.cmd("update")
end

local M = {} -- exported module object

M.setup = function(params)
    config = vim.tbl_deep_extend("keep", params, config)
end

M.toggle = function()
    config.inactive = not config.inactive
    print("Vim Saver was", not config.inactive and "activated." or "deactivated.")
end

M.on_buf_leave = function()
    bufname = vim.fn.bufname("%") or ""

    if config.inactive or not vim.bo.modified or bufname == "" or config.excluded_filetypes[vim.bo.filetype] then
        return
    end

    save_buffer(bufname)
end

return M
