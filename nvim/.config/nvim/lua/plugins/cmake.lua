return {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "akinsho/toggleterm.nvim", "stevearc/overseer.nvim" },
    config = function()
        require("cmake-tools").setup({
            cmake_build_directory = function()
                return "/build"
            end,
            cmake_generate_options = { "-DCMAKE_GENERATOR=Ninja" },
            cmake_build_options = { "-j 40" },
        })

        vim.keymap.set("n", "<leader>bg", ":CMakeGenerate<CR>", { desc = "Build Generate" })
        vim.keymap.set("n", "<leader>bb", ":CMakeBuild<CR>", { desc = "Build Compile" })
        vim.keymap.set("n", "<leader>bs", ":CMakeStopExecutor<CR>", { desc = "Build Stop" })
    end,
}
