return {
    {
        "lukas-reineke/virt-column.nvim",
        opts = {
            char = { "┆" },
            virtcolumn = "80",
            highlight = { "NonText" },
        },
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            notification = {
                window = {
                    winblend = 0,
                    border = "rounded",
                },
            },
        },
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            render = "wrapped-compact",
        },
    },
    -- filename
    {
        "b0o/incline.nvim",
        event = "BufReadPre",
        priority = 1200,
        config = function()
            require("incline").setup({
                highlight = {
                    groups = {
                        InclineNormal = { guibg = "#303270", guifg = "#a9b1d6" },
                        InclineNormalNC = { guibg = "none", guifg = "#a9b1d6" },
                    },
                },
                window = { margin = { vertical = 0, horizontal = 1 } },
                hide = { cursorline = true },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if vim.bo[props.buf].modified then
                        filename = "[*]" .. filename
                    end

                    local icon, color = require("nvim-web-devicons").get_icon_color(filename)

                    return { { icon, guifg = color }, { " " }, { filename } }
                end,
            })
        end,
    },

    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                mode = "buffers",
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" },
                },
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                show_buffer_close_icons = false,
                show_close_icon = false,
                themable = true,
            },
            --  Some tweaks for the slant style with transparent theme
            highlights = {
                -- separator = { fg = "#3c4048" },
                -- separator_visible = { fg = "#3c4048" },
                -- separator_selected = { fg = "#3c4048" },
                -- fill = { bg = "#3c4048" },
                -- tab_separator = { fg = "#3c4048" },
                -- tab_separator_selected = { fg = "#3c4048" },
                -- offset_separator = { fg = "#3c4048" },
                indicator_visible = {
                    bg = "#ffffff",
                    fg = "#ffffff",
                },
                indicator_selected = {
                    bg = "#ffffff",
                    fg = "#ffffff",
                },
            },
        },
    },
}
