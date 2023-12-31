"" === Guides === 
" Many Cool Plugins: https://dev.to/evilcel3ri/i-spent-3-years-configuring-n-vim-and-this-what-i-learnt-22on
" Web Dev: https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/ 
" Cool vim setup: https://github.com/ctaylo21/jarvis
" Cool config example (from the same person): https://github.com/ctaylo21/jarvis/blob/master/config/nvim/init.vim#L58
" More settings w/ tmux & zsh: https://www.freecodecamp.org/news/coding-like-a-hacker-in-the-terminal-79e22954968e/

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "
" Setting up vim-plug (github.com/junegunn/vim-plug)
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

"" NERDTree
Plug 'scrooloose/nerdtree'
"" Better nerdtree in all tabs
Plug 'jistr/vim-nerdtree-tabs'
"" auto-pairs to auto close ( [ {
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
"" Lightline - Powerful tabline (similar to powerline but lighter)
Plug 'itchyny/lightline.vim'
"" Vim-devicons - adding icons
Plug 'ryanoasis/vim-devicons'
"" vim-startify - fancy start page
" TODO: Make it even fancier.
Plug 'mhinz/vim-startify'
"" Dracula color scheme (Dark theme).
Plug 'dracula/vim', { 'as': 'dracula' }
"" Fuzzy search
" TODO: learn more about fzf#run and other commands.
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"" Temporary Solidity syntax.
" TODO: REmove after Coc can support solidity.
Plug 'tomlion/vim-solidity'

call plug#end()

" === NERDTree settings === "
nmap <C-\> :NERDTreeTabsToggle<CR>
" Shortcut keys moving between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
inoremap <C-Left> <Esc>:tabprevious<CR>
inoremap <C-Right> <Esc>:tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
inoremap <C-h> <Esc>:tabprevious<CR>
inoremap <C-l> <Esc>:tabnext<CR>
nnoremap <silent> <Esc><Esc>[D :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <Esc><Esc>[C :execute 'silent! tabmove ' . tabpagenr()<CR>

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "
set clipboard=unnamed       " Yank and paste with the system clipboard
set hlsearch                " highlight search 
set ignorecase              " case insensitive
set showmatch               " show matching 
set nowrap                  " do not wrap long lines by default
set number                  " add line numbers
set cc=80                   " set an 80 column border for good coding 
set mouse=a                 " enable mouse click
" === TAB/Space settings === "
set expandtab               " Insert spaces when TAB is pressed.
set softtabstop=2           " Change number of spaces that a <Tab> counts for during editing ops. It sees multiple spaces as tabstops so <BS> does the right thing
set tabstop=2               " number of columns occupied by a tab 
set shiftwidth=2            " Indentation amount for < and > commands.
set autoindent              " indent a new line the same amount as the line just typed

" === Navigation === "
" switch between window buffer
noremap <leader>w <C-^>

" === Command mode shortcuts === "
" alt-b to move one word left
" alt-f to move one word right
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "
syntax enable
let g:dracula_colorterm = 0
colorscheme dracula
"" Lightline settings.
" It is meant to be lightweight and no dependency on other plugin.
" It provides a great way to configure and integrate with other plugin.
" See: https://github.com/itchyny/lightline.vim
" Or :h g:lightline
let g:lightline = {'colorscheme': 'dracula'}
