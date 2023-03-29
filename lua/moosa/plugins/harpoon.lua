return {
	'ThePrimeagen/harpoon',
	keys = {
		{ '<leader>ma', '<cmd>lua require"harpoon.mark".add_file()<cr>' },
		{ '<leader>mt', '<cmd>lua require"harpoon.ui".toggle_quick_menu()<cr>' },
		{ '∆', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>' },
		{ '˚', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>' },
		{ '¬', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>' },
		{ '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>' },
	},
}
