local function apply_all_fixes()
  -- Get all diagnostics in the current buffer
  local diagnostics = vim.diagnostic.get(0)
  print("Total diagnostics: " .. #diagnostics)
  
  -- Filter diagnostics to only those with fixes available
  local fixable = vim.tbl_filter(function(d)
    return d.code and d.source
  end, diagnostics)
  print("Fixable diagnostics: " .. #fixable)
  
  -- Apply fixes for each diagnostic
  for _, d in ipairs(fixable) do
    print("Attempting to fix: " .. d.message)
    vim.lsp.buf.code_action({
      context = {
        diagnostics = {d},
        only = {"quickfix"}
      },
      filter = function(action)
        return action.isPreferred
      end,
      apply = true
    })
  end
  
  -- Refresh the buffer to show changes
  vim.cmd("edit")
  print("Fixes applied and buffer refreshed")
end

-- Create a command to call this function
vim.api.nvim_create_user_command('ApplyAllFixes', apply_all_fixes, {})
