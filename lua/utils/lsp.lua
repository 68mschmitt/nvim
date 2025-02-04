local utils = require('utils.utils')
local M = {}

function M.OuterMostSln(path)
	local root_pattern = require('lspconfig.util').root_pattern
	return utils.search_up_path(nil, path, root_pattern('*.sln'))
end

function M.GetOmniSharpDll()
	local path = vim.fs.normalize(vim.fn.stdpath('data') .. '/mason/packages/omnisharp/libexec/OmniSharp.dll')
  local f = io.open(path, "r")
  if f ~= nil then
    io.close(f)
  else
    path = "OmniSharp.dll"
  end
  return path
end

function M.GetLspRootDir(path)
	local root_pattern = require('lspconfig.util').root_pattern
	return M.OuterMostSln(path) or root_pattern("*.csproj")(path)
end

return M
