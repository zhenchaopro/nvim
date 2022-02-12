local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>wc", ":close<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

keymap("i", "<c-f>", "<right>", opts)
keymap("i", "<c-b>", "<left>", opts)
keymap("i", "<c-e>", "<end>", opts)
keymap("i", "<c-a>", "<home>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)vim.api.nvim_set_keymap

keymap("n", "<Leader>pp", ":Telescope projects<CR>", opts)
keymap("n", "<Leader><Leader>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-g>", ":<ESC>:noh<CR>", opts)

-- open config path
keymap("n", "<Leader>fp", ":e ~/.config/nvim/init.lua<CR>", {})

keymap("v", "<Leader>*", ":Telescope grep_string<CR>", {})
keymap("n", "<Leader>*", ":Telescope grep_string<CR>", {})

keymap("n", "gl", ":HopLine<CR>", {})
keymap("n", "<leader>/", ":HopChar1<CR>", {})
keymap("n", "<Leader>sh", ":split<CR>", {})
keymap("n", "<Leader>sv", ":vs<CR>", {})

keymap("n", "<Leader>,", ":lua require('telescope.builtin').buffers({ sort_mru = true })<cr>", {})
keymap("n", "<Leader>sp", ":Telescope live_grep<CR>", {})

-- System clipboard integration
-- https://github.com/neovide/neovide/issues/113
-- <D- stands for command or super key. help <D-
keymap("n", "<D-v>", '"+p', {})
keymap("i", "<D-v>", "<C-r>+", {})

keymap("n", "<leader>gg", ":Git<cr>", opts)
-- close current buffer
keymap("n", "<leader>bd", ":bp<bar>sp<bar>bn<bar>bd<cr>", opts)
keymap("n", "<D-k>", ":bp<bar>sp<bar>bn<bar>bd<cr>", opts)
keymap("n", "<D-f>", ":Telescope current_buffer_fuzzy_find", opts)

keymap("n", "<Leader>;", ":Telescope commands<cr>", opts)

-- todo
keymap("n", "<Leader>vp", ":VimuxPromptCommand<CR>", opts)
keymap("n", "<Leader>vl", ":VimuxRunLastCommand<CR>", opts)
keymap("n", "<Leader>vq", ":VimuxCloseRunner<CR>", opts)
