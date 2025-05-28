vim.notify("lua/plugins/lsp.lua", vim.log.levels.INFO)

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("biome", {
        cmd = { "npx", "biome", "lsp-proxy" }
      });

      vim.lsp.config("html", {
        cmd = { "npx", "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        configurationSection = { "html" },
      })

      vim.lsp.enable({
        "clangd",
        "biome",
        "lua_ls",
        "html",
        "texlab",
      })

      vim.diagnostic.config({ virtual_text = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end

          if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
          end

        end,
      })



      vim.keymap.set("n", "<leader>FS", function()
        require("telescope.builtin").lsp_document_symbols()
      end, { desc = "Find document symbols" })

      vim.keymap.set("n", "<leader>fs", function()
        require("telescope.builtin").lsp_workspace_symbols()
      end, { desc = "Find workspace symbols" })
    end,
  }
}
