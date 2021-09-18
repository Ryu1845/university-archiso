" Neomake
" call neomake#configure#automake('nrw', 50)

lua << EOF
--lualine
require("lualine").setup {options = {theme = "dracula"}}

--indent-blankline
require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"}
}

--format.nvim
require "format".setup {
    python = {
        {cmd = {"black"}},
        {cmd = {"isort"}}
    },
    ["*"] = {
        {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    }
}

--qf_helper
require "qf_helper".setup()
EOF
