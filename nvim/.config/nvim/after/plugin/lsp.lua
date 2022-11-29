local Remap = require("tayl0rgen.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

--primeagen testing it
-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  cmp_tabnine = "[TN]",
  path = "[Path]",
}

local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)

      -- For `luasnip` user.
      require("luasnip").lsp_expand(args.body)

    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == "cmp_tabnine" then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. " " .. menu
        end
        vim_item.kind = ""
      end
      vim_item.menu = menu
      return vim_item
    end,
  },

  sources = {
    -- tabnine completion? yayaya
    { name = "cmp_tabnine" },

    { name = "nvim_lsp" },


    -- For luasnip user.
    { name = "luasnip" },

    { name = "buffer" }


  },
})

local tabnine = require("cmp_tabnine.config")
tabnine:setup({
  max_lines = 1000,
  max_num_results = 20,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = "..",
})

local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function()
      vim.diagnostic.config({
        float = {
          source = 'always',
          border = border
        },
      })
      nnoremap("gd", function() vim.lsp.buf.definition() end)
      nnoremap("gt", function() vim.lsp.buf.type_definition() end)
      nnoremap("gi", function() vim.lsp.buf.implementation() end)
      nnoremap("<leader>K", function() vim.lsp.buf.hover() end)
      nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
      nnoremap("K", function() vim.diagnostic.open_float() end)
      nnoremap("<leader>dl", "<cmd>Telescope diagnostics<CR>")
      nnoremap("[d", function() vim.diagnostic.goto_next({ float = true }) end)
      nnoremap("]d", function() vim.diagnostic.goto_prev({ float = true }) end)
      nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
      nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
          filter = function(code_action)
            if not code_action or not code_action.data then
              return false
            end

            local data = code_action.data.id
            return string.sub(data, #data - 1, #data) == ":0"
          end,
          apply = true
        })
      end)
      nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
      nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
      inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
      -- diagnostic_hover()
    end,
  }, _config or {})
end

require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").tsserver.setup(config())

require 'lspconfig'.tailwindcss.setup {}

require("lspconfig").jedi_language_server.setup(config())

require("lspconfig").rust_analyzer.setup(config({
  cmd = { "rust-analyzer" },
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  }
}))

-- Rust Tools
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
--

require("lspconfig").sumneko_lua.setup(config({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      format = {
        enable = true,
        -- Put format options here
        -- NOTE: the value should be STRING!!
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        },
      },
    },
  }
}))

local opts = {
  -- whether to highlight the currently hovered symbol
  -- disable if your cpu usage is higher than you want it
  -- or you just hate the highlight
  -- default: true
  highlight_hovered_item = true,

  -- whether to show outline guides
  -- default: true
  show_guides = true,
}

require("symbols-outline").setup(opts)

local snippets_paths = function()
  local plugins = { "friendly-snippets" }
  local paths = {}
  local path
  local root_path = vim.env.HOME .. "/.local/share/nvim/site/pack/packer/start/"
  for _, plug in ipairs(plugins) do
    path = root_path .. plug
    if vim.fn.isdirectory(path) ~= 0 then
      table.insert(paths, path)
    end
  end
  return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
  paths = snippets_paths(),
  include = nil, -- Load all languages
  exclude = {},
})
