-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        disable = { "missing-fields" },
      },
    },
  },
})

lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      rustfmt = {
        overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
      },
      procMacro = {
        ignored = { leptos_macro = { "server" } },
      },
    },
  },
})

lspconfig.tailwindcss.setup({
  init_options = {
    userLanguages = {
      rust = "html",
    },
  },
  filetypes = { "rust" },
  settings = {
    tailwindCSS = {
      includeLanguages = {
        rust = "html",
        ["*.rs"] = "html",
      },
    },
  },
})

lspconfig.emmet_language_server.setup({
  filetypes = { "rust" },
})
