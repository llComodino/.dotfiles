local M = {}

M.config = {
  no_expand_dirs = {},
  default_expand = true,
  include_subdirs = true,
  debug = false
}

local function debug_log(msg)
  if M.config.debug then
    vim.notify("[ostab] " .. msg, vim.log.levels.DEBUG)
  end
end

local function normalize_path(path)
  if path:sub(1, 1) == "~" then
    path = vim.fn.expand(path)
  end

  path = vim.fn.fnamemodify(path, ":p")
  path = path:gsub("/$", "")

  return path
end

local function is_subdirectory(parent, child)
  parent = normalize_path(parent)
  child = normalize_path(child)

  if parent:sub(-1) ~= "/" then parent = parent .. "/" end

  return child:sub(1, #parent) == parent
end

local function get_current_dir()
  local current_file = vim.fn.expand("%:p")

  if current_file ~= "" then
    return vim.fn.fnamemodify(current_file, ":p:h")
  end

  return vim.fn.getcwd()
end

local function is_in_no_expand_dir()
  local current_dir = get_current_dir()
  debug_log("Current directory: " .. current_dir)

  for _, dir in ipairs(M.config.no_expand_dirs) do
    local normalized_dir = normalize_path(dir)
    debug_log("Checking against directory: " .. normalized_dir)

    if M.config.include_subdirs then
      if is_subdirectory(normalized_dir, current_dir) then
        debug_log("Match found (subdirectory): " .. normalized_dir)
        return true
      end
    else
      if normalize_path(current_dir) == normalized_dir then
        debug_log("Match found (exact): " .. normalized_dir)
        return true
      end
    end
  end

  debug_log("No matching directory found")
  return false
end

local function is_special_file()
  local current_file = vim.fn.expand("%:p")
  local file_name = vim.fn.fnamemodify(current_file, ":t")
  local file_type = vim.bo.filetype or "" 
  local special_files = {
    ["Makefile"] = true,
    ["CMakeLists.txt"] = true,
    ["CMakeCache.txt"] = true,
    ["CMakeFiles"] = true,
    ["CMakeOutput.log"] = true,
    ["CMakeError.log"] = true
  }

  if special_files[file_name] or special_files[file_type] then
    debug_log("Special file detected: " .. file_name)
    return true
  end
  return false
end


local function update_expandtab()
  if is_in_no_expand_dir() or is_special_file() then
    vim.opt_local.expandtab = false
    debug_log("Set expandtab = false for this buffer")
  else
    vim.opt_local.expandtab = M.config.default_expand
    debug_log("Set expandtab = " .. tostring(M.config.default_expand) .. " for this buffer")
  end
end

function M.setup(user_config)
  if user_config then
    for k, v in pairs(user_config) do
      M.config[k] = v
    end
  end

  for i, dir in ipairs(M.config.no_expand_dirs) do
    M.config.no_expand_dirs[i] = normalize_path(dir)
  end

  local augroup = vim.api.nvim_create_augroup("ostab", { clear = true })

  vim.api.nvim_create_autocmd({
    "BufEnter",    "BufNew",    "BufReadPre",    "BufReadPost",    "BufNewFile",    "DirChanged",    "VimEnter"  }, {
    group = augroup,
    pattern = "*",
    callback = function()
      update_expandtab()
    end,
    desc = "Update expandtab setting based on file directory"
  })

  vim.schedule(update_expandtab)

  debug_log("Plugin initialized with " .. #M.config.no_expand_dirs .. " directories:")
  for _, dir in ipairs(M.config.no_expand_dirs) do
    debug_log("- " .. dir)
  end
end

function M.add_directory(dir)
  local normalized_path = normalize_path(dir)

  for _, existing_dir in ipairs(M.config.no_expand_dirs) do
    if existing_dir == normalized_path then
      print("Directory already in list: " .. normalized_path)
      return
    end
  end

  table.insert(M.config.no_expand_dirs, normalized_path)
  print("Added directory: " .. normalized_path)

  update_expandtab()
end

function M.remove_directory(dir)
  local normalized_path = normalize_path(dir)
  local removed = false

  for i, path in ipairs(M.config.no_expand_dirs) do
    if path == normalized_path then
      table.remove(M.config.no_expand_dirs, i)
      print("Removed directory: " .. normalized_path)
      removed = true
      break
    end
  end

  if not removed then
    print("Directory not found in list: " .. normalized_path)
  else
    update_expandtab()
  end
end

function M.list_directories()
  if #M.config.no_expand_dirs == 0 then
    print("No directories configured for non-expandtab behavior")
    return
  end

  print("Directories with expandtab disabled:")
  for i, dir in ipairs(M.config.no_expand_dirs) do
    print(i .. ". " .. dir)
  end
end

function M.toggle_debug()
  M.config.debug = not M.config.debug
  print("Debug mode: " .. (M.config.debug and "enabled" or "disabled"))
end

function M.force_check()
  update_expandtab()
  print("Forced expandtab check for current buffer")
end

return M
