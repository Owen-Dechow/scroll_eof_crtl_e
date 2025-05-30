---@diagnostic disable: undefined-global

local M = {}

local ctrl_e = vim.api.nvim_replace_termcodes("<C-e>", true, false, true);
local ctrl_o = vim.api.nvim_replace_termcodes("<C-o>", true, false, true);

local last_cursor

M.scroll = function(override_o)
    local cursor = vim.api.nvim_win_get_cursor(0)[1]

    if last_cursor then
        if cursor <= last_cursor then
            last_cursor = cursor
            return
        else
            last_cursor = cursor
        end
    end

    local top_line = vim.fn.line("w0")
    local height = vim.api.nvim_win_get_height(0)
    local half = math.floor(height / 2)

    ::calculate_show::
    local target_show;

    if vim.o.scrolloff > half then
        target_show = cursor + half
    else
        target_show = cursor + vim.o.scrolloff
    end

    local shown = top_line + height - 1
    if (target_show > shown) then
        if override_o then
            vim.api.nvim_feedkeys(ctrl_o, "n", false)
        end

        vim.api.nvim_feedkeys(ctrl_e, "n", false)
        top_line = top_line + 1
        goto calculate_show
    end
end


M.setup = function()
    vim.api.nvim_create_autocmd({ "CursorMoved", "WinScrolled", }, {
        callback = function()
            if vim.api.nvim_buf_get_option(0, "modifiable") then
                M.scroll(false)
            end
        end
    })

    vim.api.nvim_create_autocmd("CursorMovedI", {
        callback = function()
            if vim.api.nvim_buf_get_option(0, "modifiable") then
                M.scroll(true)
            end
        end
    })

    vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
            if vim.api.nvim_buf_get_option(0, "modifiable") then
                last_cursor = vim.api.nvim_win_get_cursor(0)[1]
            end
        end
    })
end

return M
