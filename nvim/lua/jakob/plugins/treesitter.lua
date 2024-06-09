local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enalbe = true },
  ensure_installed = { "json", "javascript", "typescript", "tsx", "html", "css", "markdown", "bash", "vim", "lua", "cpp" },
  auto_install = true,
})
