local require = require

local plugins = {
	--------------------------------------------------- Theme ---------------------------------------------------
	---
	{
		"sontungexpt/witch",
		priority = 1000,
		lazy = false,
		-- opts = require("config.witch"),
		opts = {},
	},
	{
		"github/copilot.vim",
		lazy = false,
	},
	{
		"sontungexpt/sttusline",
		branch = "develop",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "User FilePostLazyLoaded",
		opts = {},
	},

	{
		"sontungexpt/smart-resizing",
	},

	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	event = "User FilePostLazyLoaded",
	-- 	opts = require("config.bufferline"),
	-- 	config = function(_, opts) require("bufferline").setup(opts) end,
	-- },

	--------------------------------------------------- Syntax ---------------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
		},
		event = {
			"CursorHold",
			"CursorMoved",
			"User FilePostLazyLoaded",
		},
		cmd = {
			"TSInstall",
			"TSBufEnable",
			"TSEnable",
			"TSBufDisable",
			"TSModuleInfo",
			"TSInstallFromGrammar",
		},
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = function() return require("config.nvim-treesitter") end,
	},

	-- {
	-- 	"windwp/nvim-ts-autotag",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	ft = {
	-- 		"html",
	-- 		"vue",
	-- 		"tsx",
	-- 		"jsx",
	-- 		"svelte",
	-- 		"javascript",
	-- 		"typescript",
	-- 		"javascriptreact",
	-- 		"typescriptreact",
	-- 	},
	-- },

	-- {
	-- 	"VebbNix/lf-vim",
	-- 	ft = "lf",
	-- },

	------------------------------------ Editor ------------------------------------
	{
		"sontungexpt/stcursorword",
		event = { "CursorHold", "CursorMoved" },
		main = "stcursorword",
		opts = {},
	},

	{
		"sontungexpt/url-open",
		branch = "mini",
		cmd = "URLOpenUnderCursor",
		event = { "CursorHold", "CursorMoved" },
		main = "url-open",
		opts = {},
	},

	-- OLD vim-floaterm implementation (replaced with nvzone/floaterm for better terminal management)
	-- {
	-- 	"voldikss/vim-floaterm",
	-- 	keys = {
	-- 		-- Floaterm 1 (main/default)
	-- 		{ "<leader>tt", "<cmd>FloatermToggle<CR>", desc = "Toggle Main Floaterm" },
	-- 		{ "<leader>t1", "<cmd>FloatermNew --name=term1<CR>", desc = "Create Term1" },
	-- 		{ "<leader>to", "<cmd>FloatermToggle term1<CR>", desc = "Toggle Term1" },

	-- 		-- Floaterm 2
	-- 		{ "<leader>t2", "<cmd>FloatermNew --name=term2<CR>", desc = "Create Term2" },
	-- 		{ "<leader>tp", "<cmd>FloatermToggle term2<CR>", desc = "Toggle Term2" },

	-- 		-- Floaterm 3
	-- 		{ "<leader>t3", "<cmd>FloatermNew --name=term3<CR>", desc = "Create Term3" },
	-- 		{ "<leader>tl", "<cmd>FloatermToggle term3<CR>", desc = "Toggle Term3" },

	-- 		-- Navigation between any terminals
	-- 		{ "<leader>tj", "<cmd>FloatermNext<CR>", desc = "Next Floaterm" },
	-- 		{ "<leader>tk", "<cmd>FloatermPrev<CR>", desc = "Prev Floaterm" },

	-- 		-- Go to specific terminals (creates if doesn't exist)
	-- 		{ "<leader>tg1", "<cmd>FloatermToggle term1<CR>", desc = "Go to Term1" },
	-- 		{ "<leader>tg2", "<cmd>FloatermToggle term2<CR>", desc = "Go to Term2" },
	-- 		{ "<leader>tg3", "<cmd>FloatermToggle term3<CR>", desc = "Go to Term3" },
	-- 		{ "<leader>tg4", "<cmd>FloatermToggle term4<CR>", desc = "Go to Term4" },
	-- 		{ "<leader>tg5", "<cmd>FloatermToggle term5<CR>", desc = "Go to Term5" },
	-- 		{ "<leader>tg6", "<cmd>FloatermToggle term6<CR>", desc = "Go to Term6" },
	-- 	},
	-- },

	-- NEW nvzone/floaterm implementation for better terminal management
	{
		"nvzone/floaterm",
		dependencies = "nvzone/volt",
		keys = {
			{ "<leader>tt", "<cmd>FloatermToggle<CR>", desc = "Toggle Floaterm" },
			{ "<leader>tg1", function() require("floaterm.api").switch_to_terminal(1) end, desc = "Go to Term1" },
			{ "<leader>tg2", function() require("floaterm.api").switch_to_terminal(2) end, desc = "Go to Term2" },
			{ "<leader>tg3", function() require("floaterm.api").switch_to_terminal(3) end, desc = "Go to Term3" },
			{ "<leader>tg4", function() require("floaterm.api").switch_to_terminal(4) end, desc = "Go to Term4" },
			{ "<leader>tg5", function() require("floaterm.api").switch_to_terminal(5) end, desc = "Go to Term5" },
			{ "<leader>tg6", function() require("floaterm.api").switch_to_terminal(6) end, desc = "Go to Term6" },
		},
		opts = {
			size = { h = 60, w = 70 },
			terminals = {
				{ name = "Terminal 1" },
				{ name = "Terminal 2" },
				{ name = "Terminal 3" },
				{ name = "Terminal 4" },
				{ name = "Terminal 5" },
				{ name = "Terminal 6" },
			},
		},
	},
	-- {
	-- 	"voldikss/vim-floaterm",
	-- 	lazy = false,
	-- 	keys = {
	-- 		{ "<C-t>", "<cmd>FloatermToggle<CR>", desc = "Toggle Floaterm" },
	-- 	},
	-- },

	-- {
	-- 	"sontungexpt/buffer-closer",
	-- 	cmd = "BufferCloserRetire",
	-- 	event = { "BufAdd", "FocusLost", "FocusGained" },
	-- 	config = function(_, opts) require("buffer-closer").setup {} end,
	-- },

	-- {
	-- 	"akinsho/toggleterm.nvim",
	-- 	cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
	-- 	keys = "<C-t>",
	-- 	main = "toggleterm",
	-- 	opts = function() return require("config.toggleterm") end,
	-- },

	{
		"kylechui/nvim-surround",
		keys = { "ys", "ds", "cs" },
		opts = {},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		-- opts = function() return require("config.nvim-autopairs") end,
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
			local cmp_status_ok, cmp = pcall(require, "cmp")
			local cmp_autopairs_status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
			if cmp_status_ok and cmp_autopairs_status_ok then
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
			end
		end,
	},

	-- {
	-- 	"gelguy/wilder.nvim",
	-- 	dependencies = {
	-- 		"romgrk/fzy-lua-native",
	-- 	},
	-- 	build = ":UpdateRemotePlugins",
	-- 	event = "CmdlineEnter",
	-- 	config = function() require("config.wilder") end,
	-- },

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "CursorHold", "CursorMoved" },
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
		},
		opts = {
			indent = {
				char = "│",
			},
			scope = {
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
				char = "│",
			},
		},
		config = function(_, opts)
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
			require("ibl").setup(opts)
		end,
	},

	{
		"brenoprata10/nvim-highlight-colors",
		cmd = "HighlightColors",
		event = { "CursorHold", "CursorMoved" },
		opts = function() return require("config.highlight-colors") end,
		config = function(_, opts)
			require("nvim-highlight-colors").setup(opts)
			vim.api.nvim_command("HighlightColors On")
		end,
	},

	{
		"uga-rosa/ccc.nvim",
		cmd = "CccPick",
		main = "ccc",
		opts = {},
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			require("lazy").load { plugins = { "markdown-preview.nvim" } }
			vim.fn["mkdp#util#install"]()
		end,
		config = function() vim.g.mkdp_auto_close = 1 end,
	},

	{
		"folke/which-key.nvim",
		keys = { "<leader>", "[", "]", '"', "'", "c", "v", "g", "d", "z" },
		main = "which-key",
		opts = function() return require("config.whichkey") end,
	},

	{
		"kevinhwang91/nvim-ufo",
		keys = {
			{ "zc", mode = "n", desc = "Fold current line" },
			{ "zo", mode = "n", desc = "Unfold current line" },
			{ "za", mode = "n", desc = "Toggle fold current line" },
			{ "zA", mode = "n", desc = "Toggle fold all lines" },
			{ "zr", mode = "n", desc = "Unfold all lines" },
			{ "zR", mode = "n", desc = "Fold all lines" },
		},
		dependencies = "kevinhwang91/promise-async",
		opts = function()
			vim.o.foldenable = true -- enable folding when plugin is loaded
			return require("config.nvim-ufo")
		end,
	},

	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	opts = function() return require("config.copilot") end,
	-- 	config = function(_, opts) require("copilot").setup(opts) end,
	-- },

	--	{
	--	"Exafunction/codeium.vim",
	-- 	keys = "<A-CR>",
	-- 	event = "InsertEnter",
	-- 	cmd = "Codeium",
	-- config = function()
	-- if vim.fn.filereadable(vim.fn.expand("$HOME") .. "/.codeium/config.json") == 0 then
	-- vim.api.nvim_command("Codeium Auth")
	-- end

	-- vim.g.codeium_no_map_tab = true
	-- local map = require("utils.mapper").map
	-- map("i", "<A-Tab>", "codeium#Accept()", 7)
	-- map({ "n", "i" }, "<A-CR>", "codeium#Chat()", 7)
	-- end,
	-- },

	--------------------------------------------------- File Explorer ---------------------------------------------------
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = {
			"NvimTreeToggle",
			"NvimTreeFocus",
			"NvimTreeOpen",
		},
		opts = function() return require("config.nvim-tree") end,
		config = function(_, opts) require("nvim-tree").setup(opts) end,
	},

	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",

			-- extensions
			-- "nvim-telescope/telescope-media-files.nvim",
		},
		opts = function() return require("config.telescope") end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			for _, ext in ipairs(opts.extension_list) do
				telescope.load_extension(ext)
			end
		end,
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return {
				settings = {
					save_on_toggle = true,
					sync_on_ui_close = true,
				},
			}
		end,
		config = function(_, opts)
			local harpoon = require("harpoon")
			harpoon:setup(opts)

			local map = vim.keymap.set
			local list = harpoon:list()

			-- Add and toggle UI
			map("n", "<leader>ha", function() list:add() end, { desc = "Add file to Harpoon" })
			map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(list) end, { desc = "Toggle Harpoon UI" })

			-- Jump to files
			map("n", "<leader>h1", function() list:select(1) end, { desc = "Go to Harpoon file 1" })
			map("n", "<leader>h2", function() list:select(2) end, { desc = "Go to Harpoon file 2" })
			map("n", "<leader>h3", function() list:select(3) end, { desc = "Go to Harpoon file 3" })
			map("n", "<leader>h4", function() list:select(4) end, { desc = "Go to Harpoon file 4" })

			-- Delete file from list
			map("n", "<leader>hd1", function() list:remove_at(1) end, { desc = "Delete Harpoon file 1" })
			map("n", "<leader>hd2", function() list:remove_at(2) end, { desc = "Delete Harpoon file 2" })
			map("n", "<leader>hd3", function() list:remove_at(3) end, { desc = "Delete Harpoon file 3" })
			map("n", "<leader>hd4", function() list:remove_at(4) end, { desc = "Delete Harpoon file 4" })
			map("n", "<leader>hd5", function() list:remove_at(5) end, { desc = "Delete Harpoon file 5" })
			map("n", "<leader>hd6", function() list:remove_at(6) end, { desc = "Delete Harpoon file 6" })
			map("n", "<leader>hd7", function() list:remove_at(7) end, { desc = "Delete Harpoon file 7" })
			map("n", "<leader>hd8", function() list:remove_at(8) end, { desc = "Delete Harpoon file 8" })

			-- Replace file at index with current buffer
			map("n", "<leader>hr1", function()
				list:remove_at(1)
				list:insert_at(1)
			end, { desc = "Replace Harpoon file 1 with current file" })

			map("n", "<leader>hr2", function()
				list:remove_at(2)
				list:insert_at(2)
			end, { desc = "Replace Harpoon file 2 with current file" })

			map("n", "<leader>hr3", function()
				list:remove_at(3)
				list:insert_at(3)
			end, { desc = "Replace Harpoon file 3 with current file" })

			map("n", "<leader>hr4", function()
				list:remove_at(4)
				list:insert_at(4)
			end, { desc = "Replace Harpoon file 4 with current file" })
		end,
	},

	--------------------------------------------------- Comments ---------------------------------------------------
	{
		"numToStr/Comment.nvim",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				dependencies = {
					"nvim-treesitter/nvim-treesitter",
				},
				opts = {
					enable_autocmd = false,
				},
				config = function(_, opts) require("ts_context_commentstring").setup(opts) end,
			},
		},
		keys = {
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "Comment toggle current block" },
			{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
		},
		-- because prehook is call so it need to return from a function
		main = "Comment",
		opts = function() return require("config.comment.Comment") end,
	},

	{
		"folke/todo-comments.nvim",
		cmd = { "TodoQuickFix", "TodoTelescope" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = { "CursorHold", "CmdlineEnter", "CursorMoved" },
		-- opts = require("config.comment.todo-comments"),
		main = "todo-comments",
		opts = {},
	},

	--------------------------------------------------- Git supporter ---------------------------------------------------
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		main = "gitsigns",
		opts = function() return require("config.git.gitsigns") end,
	},

	{
		"akinsho/git-conflict.nvim",
		event = { "BufReadPost", "BufNewFile" },
		main = "git-conflict",
		opts = function() return require("config.git.git-conflict") end,
	},

	--------------------------------------------------- LSP ---------------------------------------------------
	{
		"neovim/nvim-lspconfig",
		event = "User FilePostLazyLoaded",
		config = function() require("config.lsp.lspconfig") end,
	},

	{
		"sontungexpt/better-diagnostic-virtual-text",
	},

	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		-- config is in ftplugin/java.lua
	},

	{
		"mrcjkb/rustaceanvim",
		ft = "rust",
		-- config is in ftplugin/rust.lua
	},

	{
		"akinsho/flutter-tools.nvim",
		ft = "dart",
		event = "BufReadPost */pubspec.yaml",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		main = "flutter-tools",
		opts = function() return require("config.flutter-tools") end,
	},

	{
		"glepnir/lspsaga.nvim",
		cmd = "Lspsaga",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-tree/nvim-web-devicons",

			--Please make sure you install markdown and markdown_inline parser
			"nvim-treesitter/nvim-treesitter",
		},
		main = "lspsaga",
		opts = function() return require("config.lsp.lspsaga") end,
	},

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		cmd = {
			"Mason",
			"MasonLog",
			"MasonUpdate",
			"MasonInstall",
			"MasonUninstall",
			"MasonUninstallAll",
		},
		main = "mason",
		opts = function() return require("config.mason") end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
				dependencies = "rafamadriz/friendly-snippets",
				config = function() require("config.cmp.LuaSnip") end,
			},

			-- cmp sources plugins
			{
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				"saadparwaiz1/cmp_luasnip",
			},
		},
		config = function() require("config.cmp") end,
	},

	{
		"stevearc/conform.nvim",
		cmd = "ConformInfo",
		event = "BufWritePre",
		main = "conform",
		opts = function() return require("config.conform") end,
	},

	--------------------------------------------------- Debugger  ---------------------------------------------------
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{
				"mfussenegger/nvim-dap",
				config = function() require("config.dap") end,
			},
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
		},
		main = "dapui",
		opts = function() require("config.dap.dapui") end,
	},
}

require("lazy").setup(plugins, require("config.lazy-nvim"))
