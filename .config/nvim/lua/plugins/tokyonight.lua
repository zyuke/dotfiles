-- Tokyonight colorscheme
return {
  'folke/tokyonight.nvim',
  priority = 1000,
  opts = {
    transparent = not vim.g.neovide,
    styles = {
      sidebars = vim.g.neovide and 'normal' or 'transparent',
      floats = vim.g.neovide and 'normal' or 'transparent',
    },
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme 'tokyonight-moon'
    vim.cmd.hi 'Comment gui=none'
  end,
}
