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
            "nvim-dap-ui",
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {
        cmd = { "npx", "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
      })

      vim.lsp.config("html", {
        cmd = { "npx", "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        root_markers = { "package.json", ".git" },
      })

      vim.lsp.config("cssls", {
        cmd = { "npx", "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        root_markers = { "package.json", ".git" },
      })

      vim.lsp.config("jsonls", {
        cmd = { "npx", "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        root_markers = { "package.json", ".git" },
      })

      vim.lsp.enable({
        "clangd",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "lua_ls",
        "texlab",
      })

      vim.diagnostic.config({
        virtual_text = {
          current_line = true,
        },
      })

      local hide_diag_group = vim.api.nvim_create_augroup("hide-diagnostics", { clear = true })
      vim.api.nvim_create_autocmd("InsertEnter", {
        group = hide_diag_group,
        callback = function()
          vim.diagnostic.enable(false)
        end,
      })

      vim.api.nvim_create_autocmd("InsertLeave", {
        group = hide_diag_group,
        callback = function()
          vim.diagnostic.enable(true)
        end,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
        callback = function(attach_event)
          local function nmap(lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = attach_event.buf
            vim.keymap.set("n", lhs, rhs, opts)
          end

          nmap("gd", vim.lsp.buf.definition, { desc = "Go to definition (lsp)" })
          nmap("gD", vim.lsp.buf.declaration, { desc = "Go to declaration (lsp)" })
          nmap("gt", vim.lsp.buf.type_definition, { desc = "Go to type definition (lsp)" })
          nmap("gi", vim.lsp.buf.implementation, { desc = "Go to implementation (lsp)" })

          local client = vim.lsp.get_client_by_id(attach_event.data.client_id)
          local lsp_attach_group = "lsp-attach-highlights"

          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_formatting, attach_event.buf) then
            nmap("grf", vim.lsp.buf.format, { desc = "Format document" })
          end

          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, attach_event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup(lsp_attach_group, { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = attach_event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = attach_event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup("lsp-detach-highlight", { clear = true }),
              callback = function(detach_event)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = lsp_attach_group, buffer = detach_event.buf }
              end,
            })
          end

          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, attach_event.buf) then
            nmap("grh", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = attach_event.buf })
            end, { desc = "Toggle inlay hints on or off" })
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
