local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = 'float',
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = 'curved',
	},
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local float_term = Terminal:new({
	direction = 'float',
	on_open = function(term)
		vim.cmd 'startinsert!'
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			'n',
			'˚',
			'<cmd>1ToggleTerm direction=float<cr>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			't',
			'˚',
			'<cmd>1ToggleTerm direction=float<cr>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			'i',
			'˚',
			'<cmd>1ToggleTerm direction=float<cr>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(term.bufnr, '', '¬', '<nop>', { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(term.bufnr, '', '∆', '<nop>', { noremap = true, silent = true })
	end,
	count = 1,
})

function _FLOAT_TERM()
	float_term:toggle()
end

vim.api.nvim_set_keymap('n', '˚', '<cmd>lua _FLOAT_TERM()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '˚', '<cmd>lua _FLOAT_TERM()<CR>', { noremap = true, silent = true })

local vertical_term = Terminal:new({
	direction = 'vertical',
	on_open = function(term)
		vim.cmd 'startinsert!'
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			'n',
			'¬',
			'<cmd>2ToggleTerm size=100 direction=vertical<cr>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			't',
			'¬',
			'<cmd>2ToggleTerm size=100 direction=vertical<cr>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			'i',
			'¬',
			'<cmd>2ToggleTerm size=100 direction=vertical<cr>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(term.bufnr, '', '∆', '<nop>', { noremap = true, silent = true })
	end,
	count = 2,
})

function _VERTICAL_TERM()
	vertical_term:toggle(60)
end

vim.api.nvim_set_keymap('n', '¬', '<cmd>lua _VERTICAL_TERM()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '¬', '<cmd>lua _VERTICAL_TERM()<CR>', { noremap = true, silent = true })

local horizontal_term = Terminal:new({
	direction = 'horizontal',
	on_open = function(term)
		vim.cmd 'startinsert!'
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			'n',
			'∆',
			'<cmd>3ToggleTerm size=10 direction=horizontal<cr>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			't',
			'∆',
			'<cmd>3ToggleTerm size=10 direction=horizontal<cr>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			'i',
			'∆',
			'<cmd>3ToggleTerm size=10 direction=horizontal<cr>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(term.bufnr, '', '¬', '<nop>', { noremap = true, silent = true })
	end,
	count = 3,
})

function _HORIZONTAL_TERM()
	horizontal_term:toggle(10)
end

vim.api.nvim_set_keymap('n', '∆', '<cmd>lua _HORIZONTAL_TERM()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '∆', '<cmd>lua _HORIZONTAL_TERM()<CR>', { noremap = true, silent = true })
