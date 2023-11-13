function TOGGLE_DIAGNOSTICS()
    local vt = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_lines = vt })
    vim.diagnostic.config({ virtual_text = not vt })
    return vt
end

function ColorMyPencils(color)
    local color_schemes = {
        tokyonight_light = 'tokyonight-day',
        tokyonight_dark = 'tokyonight-moon',
        rose_pine_dark = 'rose-pine',
        rose_pine_light = 'rose-pine-dawn',
    }
    color = color or color_schemes.tokyonight_dark
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
