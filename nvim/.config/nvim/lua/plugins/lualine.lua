return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		icons_enabled = true,
		theme = "tokyonight",
		sections = {
			lualine_c = { "macro", "%S" },
		},
	},
}
