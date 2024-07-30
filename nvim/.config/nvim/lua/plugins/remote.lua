return {
    "amitds1997/remote-nvim.nvim",
    version = "v0.3.9", -- Pin to GitHub releases
    dependencies = {
        "nvim-lua/plenary.nvim", -- For standard functions
        "MunifTanjim/nui.nvim", -- To build the plugin UI
        "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    config = function()
        require("remote-nvim").setup({
            client_callback = function(port, workspace_config)
                local cmd = ('tmux new-window -n %s "nvim --server localhost:%s --remote-ui"'):format(
                    ("'Remote: %s'"):format(workspace_config.host),
                    port
                )
                vim.fn.jobstart(cmd, {
                    detach = true,
                    on_exit = function(job_id, exit_code, event_type)
                        -- This function will be called when the job exits
                        print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
                    end,
                })
            end,
        })
    end,
}
