-- Add indentation guides even on blank lines

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help ibl`
-- NOTE: version requirements for ibl (v3) weren't confirmed during the
-- Neovim-0.8 compatibility pass -- verify before enabling this on a 0.8 host.
return {
  'lukas-reineke/indent-blankline.nvim',
  config = function() require('ibl').setup {} end,
}
