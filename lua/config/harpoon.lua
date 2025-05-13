return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local map = vim.keymap.set
		local list = harpoon:list()

		map("n", "<leader>ha", function() list:append() end, { desc = "Harpoon: Add file" })
		map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(list) end, { desc = "Harpoon: Toggle UI" })
		map("n", "<leader>h1", function() list:select(1) end, { desc = "Harpoon: Go to file 1" })
		map("n", "<leader>h2", function() list:select(2) end, { desc = "Harpoon: Go to file 2" })
		map("n", "<leader>h3", function() list:select(3) end, { desc = "Harpoon: Go to file 3" })
		map("n", "<leader>h4", function() list:select(4) end, { desc = "Harpoon: Go to file 4" })
	end,
}
