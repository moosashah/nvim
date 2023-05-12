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

--  Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ 'user' }, {
	pattern = { 'AlphaReady' },
	callback = function()
		vim.cmd [[
     set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
     set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
     ]]
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

local group = vim.api.nvim_create_augroup('LspAttach_inlayhints', {})
vim.api.nvim_create_autocmd('LspAttach', {
	group = group,
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		require('lsp-inlayhints').on_attach(client, args.buf)
	end,
})

-- Format on save
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	group = vim.api.nvim_create_augroup('Format on save', { clear = true }),
	callback = function()
		local format = true
		if format then
			vim.lsp.buf.format({
				filter = function(c)
					local has_formatter = {
						'tsserver',
						'lua_ls',
					}
					for _, server in pairs(has_formatter) do
						if c.name == server then
							return false
						end
						return true
					end
				end,
			})
		end
	end,
})
