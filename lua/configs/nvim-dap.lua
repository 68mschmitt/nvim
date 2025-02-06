local dap = require('dap')
local dap_utils = require('dap.utils')

dap.adapters.coreclr = {
    type = 'executable',
    command = 'C:\\Users\\mschmitt\\AppData\\Local\\nvim-data\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe',
    args = { '--interpreter=vscode' },
    options = {
        detatched = false,
    }
}

dap.adapters.netcoredbg = vim.deepcopy(dap.adapters.coreclr)

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
        console = 'integratedTerminal',
    },
    {
        type = "coreclr",
        name = "Launch",
        request = "launch",
        program = function()
            local project_path = vim.fs.root(0, function(name)
                return name:match("%.csproj$") ~= nil
            end)

            if not project_path then
                return vim.notify("Couldn't find the csproj path")
            end

            local pathToFile = dap_utils.pick_file({
                filter = string.format("Debug/.*/%s", vim.fn.fnamemodify(project_path, ":t:r")),
                path = string.format("%s/bin", project_path),
            })
            print(pathToFile)
            return pathToFile
        end,
    },
    {
        type = "coreclr",
        name = "Nvim Silohost",
        request = "launch",
        program = vim.fn.getcwd() .. '\\Silohost\\bin\\Debug\\net8.0\\Silohost.dll'
    },
}
