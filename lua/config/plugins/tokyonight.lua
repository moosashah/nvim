 return {
     'folke/tokyonight.nvim',
     event = 'VimEnter',
     config = function()
         require('tokyonight').setup({
         sidebars = { 'qf', 'vista_kind', 'terminal', 'lazy' },
         day_brightness = 0.3,
         hide_inactive_statusline = true,
         dim_inactive = true,
         transparent = false,
     })
     vim.cmd.colorscheme('tokyonight-moon')
     end
 }

