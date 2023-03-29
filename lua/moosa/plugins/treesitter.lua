return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = 'all',
      ignore_install = { 'phpdoc' },
      rainbow = {
        enable = true,
        extended_mode = false,
      },
      highlight = {
        enable = true,
        disable = { 'css' },
      },
      indent = { enable = true, disable = { 'python', 'css' } },
    })
  end,
  dependencies = {
    { 'windwp/nvim-ts-autotag' },
    { 'p00f/nvim-ts-rainbow' },
    { 'lukas-reineke/indent-blankline.nvim'
    },
  },
}