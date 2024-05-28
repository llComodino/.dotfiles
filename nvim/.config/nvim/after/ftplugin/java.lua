local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

local home = os.getenv "HOME"
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local os_config = "linux"

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {

  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    "-jar",
    vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. os_config,
    "-data",
    workspace_dir,
  },

  root_dir = require("jdtls.setup").find_root { ".git", "gradlew", "build.gradle" },

  settings = {

    java = {

      eclipse = {
        downloadSources = true,
      },

      configuration = {

        updateBuildConfiguration = "interactive",

        runtimes = {
          {
            name = "JavaSE-11",
            path = "~/.sdkman/candidates/java/11.0.12-open",
          },
          {
            name = "JavaSE-18",
            path = "~/.sdkman/candidates/java/18.0.2-sem",
          },
          {
            name = "JavaSE-21",
            path = "~/.sdkman/candidates/java/21.0.3-tem",
          },
        },

      },

      maven = {
        downloadSources = true,
      },

      referencesCodeLens = {
        enabled = true,
      },

      references = {
        includeDecompiledSources = true,
      },

      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },

      format = {
        enabled = false,
      },

    },

    signatureHelp = { enabled = true },
    extendedClientCapabilities = extendedClientCapabilities,
  },

}

config["on_attach"] = function(client, bufnr)
  local _, _ = pcall(vim.lsp.codelens.refresh)
end


vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

require("jdtls").start_or_attach(config)

--[[
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local vopts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  C = {
    name = "Java",
    o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
    v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
    c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
    t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
    T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
    u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
  },
}

local vmappings = {
  C = {
    name = "Java",
    v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable" },
    c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
    m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
  },
}

which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(vmappings, vopts)

]]--

-- local config = {
    -- cmd = {
        -- vim.fn.expand '~/.local/share/nvim/mason/bin/jdtls'
    -- },

    -- root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
-- }
-- require('jdtls').start_or_attach(config)
