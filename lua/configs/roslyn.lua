local M = {}

M.opts =
{
    config = {
        settings = {
            ["csharp|auto_insert"] = {
                dotnet_enable_auto_insert = true,
            },
            ["csharp|quick_info"] = {
                dotnet_show_remarks_in_quick_info = true,
            },
            ["csharp|type_members"] = {
                dotnet_member_insertion_location = true,
                dotnet_property_generation_behavior = true
            },
            ["csharp|background_analysis"] = {
                dotnet_compiler_diagnostics_scope = "fullSolution",
                dotnet_analyzer_diagnostics_scope = "fullSolution"
            },
            ["csharp|inlay_hints"] = {
                csharp_enable_inlay_hints_for_implicit_object_creation = true,
                csharp_enable_inlay_hints_for_implicit_variable_types = true,
                csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                csharp_enable_inlay_hints_for_types = true,
                dotnet_enable_inlay_hints_for_indexer_parameters = true,
                dotnet_enable_inlay_hints_for_literal_parameters = true,
                dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                dotnet_enable_inlay_hints_for_other_parameters = true,
                dotnet_enable_inlay_hints_for_parameters = true,
                dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = false,
                dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = false,
                dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = false,
            },
            ["csharp|code_lens"] = {
                dotnet_enable_references_code_lens = true,
            },
            ["csharp|symbol_search"] = {
                dotnet_search_reference_assemplies = true,
            },
            ["csharp|completion"] = {
                dotnet_provide_regex_completions = true,
                dotnet_show_completion_items_from_unimported_namespaces= true,
                dotnet_show_name_completion_suggetions = true,
            },
            ["csharp|formatting"] = {
                dotnet_organize_imports_on_format = true,
            }
        }
    },
}

function M.init()
    local keymap = vim.keymap.set
    keymap("n", "<leader>tar", function() vim.cmd([[Roslyn target]]) end)

    keymap("n", "<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "Toggle inlay hints" })
end

return M;
