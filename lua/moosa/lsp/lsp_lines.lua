local status, lsp_lines = pcall(require, 'lsp_lines')
if not status then
	print 'lsp_lines is not working'
end

lsp_lines.setup()
