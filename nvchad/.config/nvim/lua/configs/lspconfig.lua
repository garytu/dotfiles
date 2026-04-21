require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "clangd" }
vim.lsp.enable(servers)