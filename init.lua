vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.filetype.add({
  extension = {
    html = "html",
  },
  pattern = {
    ["*.html"] = "html",
  },
})
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set('n', '<C-esc>', ':q<CR>', {})
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

require("lazy").setup("plugins")
