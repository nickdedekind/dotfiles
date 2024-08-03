return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = function()
		local find_buffer_by_type = function(type)
			for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
				local ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
				if ft == type then
					return bufnr
				end
			end
			return -1
		end
		local toggle_neotree = function(toggle_command)
			local buf = find_buffer_by_type("neo-tree")
			if buf == vim.api.nvim_get_current_buf() then
				require("neo-tree.command").execute({ action = "close" })
			else
				toggle_command()
			end
		end

		return {
			{
				"\\",
				function()
					toggle_neotree(function()
						vim.cmd("Neotree reveal")
					end)
				end,
				desc = "Toggle Explorer",
			},
		}
	end,
	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
		})
	end,
}
