return {
	'kevinhwang91/nvim-bqf',
	event = 'BufEnter',
	keys = {
		{ '<C-Down>', ':cnext<CR>' },
		{ '<C-Up>', ':cprev<CR>' },
		{ '<leader>qq', ':cclose<CR>' },
		{ '<leader>qo', ':copen<CR>' },
	},
}
