function TOGGLE_DIAGNOSTICS()
  local vt = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_lines = vt })
  vim.diagnostic.config({ virtual_text = not vt })
  return vt
end

function ColorMyPencils(color)
  color = color or 'tokyonight-moon'
  vim.cmd.colorscheme(color)
  -- if color ~= 'tokyonight-day' then
  -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  -- end
end

ColorMyPencils 'tokyonight-moon'
