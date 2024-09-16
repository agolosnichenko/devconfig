return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<leader>dO",
                function()
                    require("dap").step_out()
                end,
                desc = "Step Out",
            },
            {
                "<leader>do",
                function()
                    require("dap").step_over()
                end,
                desc = "Step Over",
            },
        },
        opts = function()
            local dap = require("dap")
            if not dap.adapters["pwa-chrome"] then
                dap.adapters["pwa-chrome"] = {
                    type = "server",
                    host = "localhost",
                    port = "${port}",
                    executable = {
                        command = "node",
                        args = {
                            require("mason-registry").get_package("js-debug-adapter"):get_install_path()
                                .. "/js-debug/src/dapDebugServer.js",
                            "${port}",
                        },
                    },
                }
            end
            for _, lang in ipairs({
                "typescript",
                "javascript",
                "typescriptreact",
                "javascriptreact",
            }) do
                dap.configurations[lang] = dap.configurations[lang] or {}
                table.insert(dap.configurations[lang], {
                    type = "pwa-chrome",
                    request = "launch",
                    name = "Launch Chrome",
                    url = "http://localhost:3000",
                    sourceMaps = true,
                })
            end
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
            virt_text_win_col = 80,
        },
    },
}
