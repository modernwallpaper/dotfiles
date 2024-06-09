local setup, nvimtree = pcall(require, "nvim-tree/nvim-tree.lua")
if not setup then
  return
end

nvimtree.setup()
