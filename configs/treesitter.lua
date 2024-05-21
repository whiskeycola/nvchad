-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.glimmer = {
--   install_info = {
--     url = "~/github.com/tree-sitter-glimmer",
--     files = {
--       "src/parser.c",
--       "src/scanner.c",
--     },
--   },
--   filetype = "hbs",
--   used_by = {
--     "handlebars",
--     "html.handlebars",
--   },
-- }
--
local opts = {
  ensure_installed = {
    "htmldjango",
    -- "glimmer",
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "rust",
    "bash",
    "git_config",
    "gitignore",
    "go",
    "json",
    "proto",
    "python",
    "regex",
    "scss",
    "sql",
    "toml",
    "twig",
    "yaml",
    "xml",
  },
  indent = {
    enable = true,
  },
}
return opts
