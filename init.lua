--  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
--  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
--  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
--  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
--  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
--  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

-- vim.opt.runtimepath:prepend(vim.fn.stdpath('config') .. '/../bothvim')
-- vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '/../bothvim/after')
-- vim.opt.runtimepath:prepend(vim.fn.stdpath('data') .. '/../bothvim/site')
-- vim.opt.runtimepath:append(vim.fn.stdpath('data') .. '/../bothvim/site/after')

-- vim.opt.packpath = vim.opt.runtimepath:get()

vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require('lazy').setup 'myplugins'

if vim.g.neovide then
  vim.g.neovide_transparency = 0.7
  vim.g.neovide_cursor_vfx_mode = 'railgun'

  vim.g.gui_font_default_size = 12
  vim.g.gui_font_size = vim.g.gui_font_default_size
  vim.g.gui_font_face = [[FantasqueSansMono Nerd Font]]

  RefreshGuiFont = function()
    vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
  end

  ResizeGuiFont = function(delta)
    vim.g.gui_font_size = vim.g.gui_font_size + delta
    RefreshGuiFont()
  end

  ResetGuiFont = function()
    vim.g.gui_font_size = vim.g.gui_font_default_size
    RefreshGuiFont()
  end

  -- Call function on startup to set default value
  ResetGuiFont()

  -- Keymaps

  local opts = { noremap = true, silent = true }

  vim.keymap.set({ 'n', 'i' }, "<C-=>", function() ResizeGuiFont(1) end, opts)
  vim.keymap.set({ 'n', 'i' }, "<C-->", function() ResizeGuiFont(-1) end, opts)
  vim.keymap.set({ 'n', 'i' }, "<C-0>", function() ResetGuiFont() end, opts)
end

vim.cmd.source(vim.fn.stdpath('config') .. '/both.vim')

vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.conceallevel = 0
    vim.cmd 'startinsert'
  end
})

-- vim.g.vimtex_compiler_program = 'nvr' -- nvr for vimtex
-- vim.fn.setenv("EDITOR", "nvr")

-- vim.g.UltiSnipsUsePythonVersion = 3

vim.opt.guicursor:append 'a:blinkwait1-blinkon530-blinkoff530'

local myColorSchemes = {
  'kanagawa',
  'tokyonight',
  'onedark',
  'gruvbox-material',
  'catppuccin',
}

vim.cmd.colorscheme(myColorSchemes[math.random(#myColorSchemes)])
