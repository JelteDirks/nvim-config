return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
        },
        opts = {
        },
      }
    },
    keys = {
      {
        '<leader>dc',
        function()
          require("dap").continue()
        end,
        desc = 'Continue (DAP)',
      },
      {
        '<leader>du',
        function()
          require("dap").step_out()
        end,
        desc = 'Step out (DAP)',
      },
      {
        '<leader>dn',
        function()
          require("dap").step_over()
        end,
        desc = 'Step over (DAP)',
      },
      {
        '<leader>ds',
        function()
          require("dap").step_into()
        end,
        desc = 'Step into (DAP)',
      },
      {
        '<leader>db',
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = 'Toggle breakpoint (DAP)',
      },
      {
        '<leader>dh',
        function()
          require('dap').run_to_cursor()
        end,
        desc = 'Run to cursor (DAP)',
      },
      {
        '<leader>dui',
        function()
          require('dapui').toggle()
        end,
        desc = 'Toggle dap ui (DAP)',
      },
      {
        '<leader>drc',
        function()
          require("dap").repl.close()
        end,
        desc = 'Close debug repl (DAP)',
      },
      {
        '<leader>dro',
        function()
          require("dap").repl.open()
        end,
        desc = 'Open debug repl (DAP)',
      },
      {
        '<leader>dl',
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint log message: "))
        end,
        desc = 'Set log point at cursor (DAP)',
      },
      {
        '<leader>dt',
        function()
          require("dap").terminate()
        end,
        desc = 'Terminate current session (DAP)',
      },
      {
        '<leader>df',
        function()
          require("dap").focus_frame()
        end,
        desc = 'Focus on the current frame (DAP)',
      },
    },
    config = function()
      local dapui = require("dapui")
      local dap = require("dap")

      dapui.setup()

      local codelldbext = vim.fn.expand("~/bin/codelldb/")
      local codelldbadapter = codelldbext .. "extension/adapter/codelldb"
      local stat = vim.uv.fs_stat(codelldbadapter)

      if not stat or stat.type ~= "file" then
        vim.notify("can not find codelldb", vim.log.levels.ERROR)
      end

      dap.adapters.codelldb = {
        type = "executable",
        command = codelldbadapter,
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            local cwd = vim.fn.getcwd()
            local has_make = vim.fn.executable("make")
            local has_makefile = vim.fn.filereadable(cwd .. "/Makefile") == 1 or
                vim.fn.filereadable(cwd .. "/makefile") == 1

            if has_make and has_makefile then
              print("building with make")
              local make_result = vim.fn.system("make")
              if vim.v.shell_error ~= 0 then
                vim.notify("make failed", vim.log.levels.ERROR)
                return
              end
            end

            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    end
  }
}
