local autocmd = vim.api.nvim_create_autocmd
vim.g.vimtex_imaps_enabled = true

-- Compile on initialization, cleanup on quit
local vimtex_augroup = vim.api.nvim_create_augroup(
    'vimtex_event_1',
    { clear = true }
)
autocmd(
    'User',
    {
        pattern = 'VimtexEventInitPost',
        command = 'TSDisable highlight | call vimtex#compiler#compile()',
        group = vimtex_augroup
    }
)
autocmd(
    'User',
    {
        pattern = 'VimtexEventQuit',
        command = 'call vimtex#compiler#clean(0)',
        group = vimtex_augroup
    }
)



-- TOC settings
vim.g.vimtex_toc_config = {
    name = 'TOC',
    layers = "['content', 'todo']",
    resize = 1,
    split_width = 50,
    todo_sorted = 0,
    show_help = 1,
    show_numbers = 1,
    mode = 2
}


-- Ignore undesired errors and warnings
vim.g.vimtex_quickfix_ignore_filters = {
    'Underfull',
    'Overfull',
    'undefined references',
    '(re)run Biber',
    'Unused global option(s)',
}

vim.g.vimtex_quickfix_autoclose_after_keystrokes = 4

-- Affichage des symbole math comme dans le document
vim.opt.conceallevel=2
vim.g.tex_conceal='abdmg'

---- Spell check
--autocmd(
--    'FileType',
--    {
--        pattern = 'tex,latex,markdown',
--        command = "setlocal spell spelllang=en,fr"
--    }
--)
