" Required:
if has('vim_starting')
  set nocompatible
  set sessionoptions-=options
endif

" PLUGINS BUNDLE
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugs here:
call plug#begin(stdpath('config') . '/bundle')
" APPEARANCE
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'dracula/vim', { 'as': 'dracula' }
" UTILITIES
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'jghauser/kitty-runner.nvim'
    Plug 'lukas-reineke/format.nvim'
    Plug 'sirver/ultisnips'
        let g:UltiSnipsExpandTrigger = '<tab>'
        let g:UltiSnipsJumpForwardTrigger = '<tab>'
        let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" DEVELOPER
    Plug 'stevearc/qf_helper.nvim'
    Plug 'lervag/vimtex'
        let g:tex_flavor='latex'
        let g:vimtex_view_method='zathura'
        let g:vimtex_quickfix_mode=0
    Plug 'KeitaNakamura/tex-conceal.vim'
        set conceallevel=1
        let g:tex_conceal='abdmg'
        hi Conceal ctermbg=none
call plug#end()
