local dap = require('dap')

local ph_status, dotnet_ph = pcall(require, 'utils') 

dap.adapters.coreclr = {
  type = 'executable',
  command = dotnet_ph.GetNetCoreDbgPath(),
  args = {'--interpreter=vscode'},
  options = {
    detatched = false,
    cwd = dotnet_ph.GetDebugDwd
  }
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = dotnet_ph.GettDllPath,
    console = "integratedTerminal"
  },
}
