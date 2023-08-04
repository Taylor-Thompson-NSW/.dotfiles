require('nvim-treesitter.configs').setup {
  ensure_installed = { "help", "javascript", "typescript", "tsx", "c", "rust" },
  highlight = {
    enable = true,
  },
  custom_captures = {
    -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    ["foo.bar"] = "Identifier",
  },
  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  -- Using this option may slow down your editor, and you may see some duplicate highlights.
  -- Instead of true it can also be a list of languages
  additional_vim_regex_highlighting = false,
  context_commentstring = {
    enable = true,
    enable_autocmd = false,

    config = {
      typescript = {
        __default = '// %s',
        __multiline = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s',
        __parent = {
          jsx_expression = '// %s',
        },
      },
      javascript = {
        __default = '// %s',
        __multiline = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s',
        __parent = {
          jsx_expression = '// %s',
        },
      }
    }

  }
}
