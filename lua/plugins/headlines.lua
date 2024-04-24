--require("headlines").setup({
--  rmd = {
--    query = vim.treesitter.query.parse(
--      "markdown",
--      [[
--                (atx_heading [
--                    (atx_h1_marker)
--                    (atx_h2_marker)
--                    (atx_h3_marker)
--                    (atx_h4_marker)
--                    (atx_h5_marker)
--                    (atx_h6_marker)
--                ] @headline)
--
--                (thematic_break) @dash
--
--                (fenced_code_block) @codeblock
--
--                (block_quote_marker) @quote
--                (block_quote (paragraph (inline (block_continuation) @quote)))
--                (block_quote (paragraph (block_continuation) @quote))
--                (block_quote (block_continuation) @quote)
--            ]]
--    ),
--    treesitter_language = "markdown",
--    -- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
--    bullets = {},
--    codeblock_highlight = "CodeBlock",
--  },
--})
