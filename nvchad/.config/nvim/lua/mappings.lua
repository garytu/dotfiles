require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader> ", "<cmd>FzfLua files<cr>", { desc = "Find files (fzf)" })
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files (fzf)" })
map("n", "<leader>fw", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep (fzf)" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>", { desc = "Find oldfiles (fzf)" })

-- map("n", "<leader>fc", function() require('fzf-lua').files({cwd="~/.config"}) end , { desc = "Find config files" })
