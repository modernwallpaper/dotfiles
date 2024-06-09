local status, heirline = pcall(require, "heirline.nvim")
if not status then
  return
end

heirline.setup({})
