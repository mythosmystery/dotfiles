local servers = {
  "tsserver",
  "rust_analyzer",
  "clangd",
  "gopls",
  "elixirls",
  "vuels",
  "pyright",
  "cssls",
  "html",
  "tailwindcss",
  "svelte",
  "templ",
  "lua_ls"
}

return {
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require("lsp-inlayhints").setup()
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      for _, server in ipairs(servers) do
        local opts = {
          capabilities = capabilities,
        }

        if server == "rust_analyzer" then
          opts.settings = {
            ["rust-analyzer"] = {
              inlayHints = {
                auto = true
              },
            },
          }
        end

        lspconfig[server].setup(opts)
      end

      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, bufnr)

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
          vim.keymap.set("n", "gD", vim.lsp.buf.definition, {})
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
          vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
          vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
          vim.keymap.set("n", "gR", vim.lsp.buf.rename, {})
        end,
      })
    end,
  },
}
