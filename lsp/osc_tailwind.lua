local monorepo_root = vim.fs.normalize(vim.fn.expand('~/osc/monorepo'))
local ohana_root = vim.fs.joinpath(monorepo_root, 'apps', 'ohana')

local function is_ohana_file(filename)
	filename = vim.fs.normalize(filename)

	return filename == ohana_root or vim.startswith(filename, ohana_root .. '/')
end

---@type vim.lsp.Config
return {
	cmd = {
		'osc-tailwind-lsp',
		'--stdio',
		'--map',
		vim.fs.joinpath(monorepo_root, 'tmp', 'osc-tailwind-map.json'),
	},
	filetypes = {
		'html',
		'css',
		'scss',
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
	},
	root_dir = function(bufnr, on_dir)
		local filename = vim.api.nvim_buf_get_name(bufnr)

		if is_ohana_file(filename) then
			on_dir(monorepo_root)
		end
	end,
}
