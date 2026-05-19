local keymap = vim.keymap.set
local opts = { silent = true }

keymap('n', '<leader>ll', vim.cmd.Lazy, opts)
keymap('n', '<leader>lp', '<cmd>Lazy profile<CR>', opts)

-- Run monorepo checks in a persistent tmux split.
keymap('n', '<C-g>', function()
	local monorepo = vim.fn.expand '~/osc/monorepo'
	local current_dir = vim.fn.getcwd()
	if current_dir ~= monorepo and not vim.startswith(current_dir, monorepo .. '/') then
		vim.notify('Only available in ~/osc/monorepo', vim.log.levels.WARN)
		return
	end

	if not vim.env.TMUX then
		vim.notify('Not inside tmux', vim.log.levels.WARN)
		return
	end

	local command = 'pnpm turbo typecheck lint build --filter=ohana'
	local pane_id = vim.fn.system('tmux split-window -P -F "#{pane_id}" -v -l 40% -c ' .. vim.fn.shellescape(monorepo))
	pane_id = vim.trim(pane_id)
	vim.fn.system('tmux send-keys -t ' .. vim.fn.shellescape(pane_id) .. ' ' .. vim.fn.shellescape(command) .. ' C-m')
end, opts)

vim.keymap.del({ 'n', 'x' }, '[%')
vim.keymap.del({ 'n', 'x' }, ']%')
-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move highlight up and down
keymap('v', 'J', ':m \'>+1 <cr>gv=gv')
keymap('v', 'K', ':m \'<-2 <cr>gv=gv')

-- Better paste
keymap('v', 'p', '"_dP', opts)

-- Better j and k
keymap({ 'n', 'x' }, 'j', 'gj', opts)
keymap({ 'n', 'x' }, 'k', 'gk', opts)

-- Center page on scroll
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '*', '*zz', opts)
keymap('n', '#', '#zz', opts)

-- Clear highlights
keymap('n', '<leader>h', vim.cmd.nohlsearch, opts)
