-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = { 'qf', 'help', 'man', 'lspinfo', 'spectre_panel', 'lir' },
	callback = function()
		vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
	end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ 'user' }, {
	pattern = { 'AlphaReady' },
	callback = function()
		vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
	end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = { 'gitcommit', 'markdown' },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.cmd 'autocmd BufEnter * ++nested if winnr(\'$\') == 1 && bufname() == \'NvimTree_\' . tabpagenr() | quit | endif'

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
	callback = function()
		vim.cmd 'set formatoptions-=cro'
	end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
	callback = function()
		vim.highlight.on_yank({ higroup = 'Visual', timeout = 100 })
	end,
})

vim.api.nvim_create_user_command('WatchRun', function()
	local overseer = require 'overseer'
	overseer.run_template({ name = 'run script' }, function(task)
		if task then
			task:add_component({ 'restart_on_save', path = vim.fn.expand '%:p' })
			local main_win = vim.api.nvim_get_current_win()
			overseer.run_action(task, 'open hsplit')
			vim.api.nvim_set_current_win(main_win)
		else
			vim.notify('WatchRun not supported for filetype ' .. vim.bo.filetype, vim.log.levels.ERROR)
		end
	end)
end, {})
