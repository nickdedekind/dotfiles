return {
	"Civitasv/cmake-tools.nvim",
	config = function()
		require("cmake-tools").setup({
			cmake_build_directory = function()
				return "build"
			end,
			cmake_generate_options = { "-DCMAKE_GENERATOR=Ninja" },
			cmake_build_options = { "-j 40" },
		})
	end,
}
