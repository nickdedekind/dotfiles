return { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
        local wk = require("which-key")
        wk.setup()
        -- wk.add({
        --     { "<leader>d", group = "Debugging" },
        -- })
    end,
}
