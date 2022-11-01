local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
  return
end

local has_noice, noice = pcall(require, 'noice')
if not has_noice then
  print 'no noice v sad'
end

noice.setup({
  routes = {
    {
      filter = {
        event = 'notify',
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = 'msg_show.wmsg',
        kind = '',
        find = 'BOTTOM',
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = 'msg_show',
        kind = '',
      },
      opts = { skip = true },
    },
    {
      view = 'notify',
      filter = { event = 'msg_showmode' },
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
  },
})

telescope.load_extension 'noice'
