-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local langs = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'python', 'rust' }

    require('nvim-treesitter').install(langs):wait(300000)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = langs,
      callback = function() vim.treesitter.start() end,
    })
  end,
}
