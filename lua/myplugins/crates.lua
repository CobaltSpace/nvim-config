return {
  'saecki/crates.nvim',
  event = 'BufRead Cargo.toml',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  config = true
}
