local has_navic, navic = pcall(require, 'nvim-navic')
if not has_navic then
  return
end

navic.setup({
  highlight = true,
})

vim.o.winbar = '%{%v:lua.require\'nvim-navic\'.get_location()%}'
