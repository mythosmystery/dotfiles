return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["aC"] = "@comment.outer",
							["iC"] = "@comment.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
						},
					},
				},
			})
			vim.treesitter.language.register("markdown", "octo")
		end,
	},
}
