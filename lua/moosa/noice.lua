local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
  return
end

local has_noice, noice = pcall(require, 'noice')
if not has_noice then
  return
end

noice.setup()


telescope.load_extension("noice")
