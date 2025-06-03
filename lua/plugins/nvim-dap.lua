return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
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
        '<leader>dui',
        function()
          require('dapui').toggle()
        end,
        desc = 'Debug: See last session result.',
      },
    },
    config = function()
      local dapui = require("dapui")
      local dap = require("dap")

      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    end
  }
}
