return {
  'lukas-reineke/indent-blankline.nvim',
  config = {
    char = '▏',
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
    buftype_exclude = { 'terminal', 'nofile' },
    filetype_exclude = {
      'help',
      'NvimTree',
    },
  }
}
