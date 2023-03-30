return {
  'folke/noice.nvim',
  event = 'VimEnter',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
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
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
  },
}
