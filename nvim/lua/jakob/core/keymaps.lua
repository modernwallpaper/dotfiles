vim.g.mapleader = " "

local keymap = vim.keymap

local tree_open = false

_G.toggle_tree = function ()
  if tree_open then
    vim.cmd("Neotree close")
    tree_open = false
  else
    vim.cmd("Neotree")
    tree_open = true
  end
end

local tree_focused = false
_G.focuse_tree = function ()
  if tree_focused then
    vim.cmd("wincmd l")
    tree_focused = false
  else
    vim.cmd("Neotree focus")
    tree_focused = true
  end
end

-- terminal
vim.keymap.set("n", "<leader>t",  "<cmd>Lspsaga term_toggle<CR>", { silent = true })

-- movement
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<leader>e", ":lua toggle_tree()<CR>", { noremap = true ,silent = true })
keymap.set("n", "<leader>h", ":lua focuse_tree()<CR>", { silent = true })

-- window splitting
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- slplit horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>", { silent = true }) -- close current window

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>", { silent = true })  -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", { silent = true }) -- close current tab
keymap.set("n", "<TAB>", ":tabn<CR>", { silent = true }) -- go to next tab

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

-- Other Vim Configs
vim.opt.fillchars = { eob = " " }
vim.o.scrolloff = 10

-- trouble
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>",
  {silent = true, noremap = true}
)
