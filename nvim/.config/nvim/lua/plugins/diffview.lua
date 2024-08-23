return {
    "sindrets/diffview.nvim",
    config = function()
        local diffview = require("diffview")

        vim.keymap.set("n", "<leader>go", ":DiffviewOpen<CR>", { silent = true, desc = "Open diff view" })
        vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", { silent = true, desc = "Close diff view" })
    end,
}
