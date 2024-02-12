return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.register({
			e = { "<cmd>NvimTreeToggle<cr>", "Open File tree" },
			w = { "<cmd>wa!<cr>", "Save" },
			q = { "<cmd>q<cr>", "Quit" },
			b = { "<cmd>Telescope buffers<cr>", "Buffer Menu" },
			x = { "<cmd>Bdelete<cr>", "Close Buffer" },
			h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Menu" },
			m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Mark" },
			n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next" },
			p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev" },
			d = {
				name = "dap",
				t = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
				c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
				s = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
				i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
				o = { "<cmd>lua require('dap').step_out()<cr>", "Step Out" },
				r = { "<cmd>lua require('dap').repl.toggle()<cr>", "Toggle Repl" },
				x = { "<cmd>lua require('dap').terminate()<cr>", "Terminate" },
			},
			c = {
				name = "code",
				a = { vim.lsp.buf.code_action, "Code Actions" },
				f = {
					function()
						vim.lsp.buf.format({
							filter = function(client)
								return client.name ~= "tsserver"
							end,
						})
					end,
					"Format File",
				},
				h = { require("lsp-inlayhints").toggle, "Toggle Inlay Hints" },
			},
			[" "] = { "<cmd> Telescope find_files<cr>", "Search" },
			t = {
				name = "Terminal",
				f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
				h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
				v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
				g = { "<cmd>ToggleTerm direction=float<cr>lazygit<cr>", "LazyGit" },
			},
			u = {
				name = "undo tree",
				u = { "<cmd>UndotreeToggle<cr>", "Toggle" },
				s = { "<cmd>UndotreeShowDiff<cr>", "Show Diff" },
				c = { "<cmd>UndotreeClear<cr>", "Clear" },
			},
			g = {
				name = "Git",
				b = { "<cmd>Git blame<cr>", "Blame" },
				o = {
					name = "Octo (Github)",
					i = { "<cmd>Octo issue list<cr>", "Issue List" },
					I = { "<cmd>Octo issue create<cr>", "Issue Create" },
					p = { "<cmd>Octo pr list<cr>", "PR List" },
					P = { "<cmd>Octo pr create<cr>", "PR Create" },
				},
			},
			f = {
				name = "Find",
				b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
				f = { "<cmd>Telescope find_files<cr>", "Find File" },
				h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
				R = { "<cmd>Telescope registers<cr>", "Registers" },
				g = { "<cmd>Telescope live_grep<cr>", "Grep" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				s = { "<cmd> Telescope grep_string<cr>", "Grep String" },
				p = {
					"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
					"Colorscheme with Preview",
				},
			},
			P = {
				name = "Plugins",
				i = { "<cmd>Lazy install<cr>", "Install" },
				s = { "<cmd>Lazy sync<cr>", "Sync" },
				c = { "<cmd>Lazy clean<cr>", "Clean" },
				m = { "<cmd>Mason<cr>", "Mason" },
			},
			D = {
				name = "database",
				m = { "<cmd>lua require('mongo-nvim.telescope.pickers').database_picker()<cr>", "Mongo" },
			},
		}, { prefix = "<leader>" })
		wk.register({
			s = {
				function()
					require("telescope.builtin").grep_string({ search = vim.getVisualSelection() })
				end,
				"Grep Visual Selection",
			},
		}, { prefix = "<leader>", mode = "v" })
	end,
}
