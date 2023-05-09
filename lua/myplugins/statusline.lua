return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    -- enabled = false,
    opts = {
      options = { globalstatus = true },
      tabline = {
        lualine_a = { 'buffers' },
        lualine_b = { 'branch' },
        -- lualine_c = {},
        lualine_x = { {
          require('lazy.status').updates,
          cond = require('lazy.status').has_updates,
          color = { fg = '#ff9e64' },
        } },
        -- lualine_y = {},
        lualine_z = { 'tabs' }
      }
    }
  },
  {
    'freddiehaddad/feline.nvim',
    enabled = false,
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = true,
  },
  {
    'NTBBloodbath/galaxyline.nvim',
    enabled = false,
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('galaxyline.themes.eviline')
    end
  },
  {
    'rebelot/heirline.nvim',
    enabled = false,
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = true
  },
}
