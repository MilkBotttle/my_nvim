set nocp

" Ansible vim config


call plug#begin('~/.config/nvim/plugged')
" Normal Plug
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'lepture/vim-jinja'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 't9md/vim-choosewin'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'

call plug#end()

filetype plugin indent off
syntax on
let g:solarized_termcolors=256
set background=dark
colorscheme gruvbox
set expandtab
set ai
set si
set is
set wildmenu
set completeopt=longest,menuone
" Auto remove extra spaces
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

au FileType gitcommit set tw=72
au FileType python set ts=8 sw=4 sts=4
au FileType yaml set ts=2 sw=2 sts=2

" If python use set ts=8 et sw=4 sts=4
autocmd BufNewFile,BufRead *.py set ts=8 sw=4 sts=4
autocmd BufNewFile,BufRead *.yaml set ts=2 sw=2 sts=2
autocmd BufNewFile,BufRead *.yml set ts=2 sw=2 sts=2
autocmd BufNewFile,BufRead * set ts=4 et sw=4 sts=4

"KEY BINDING
"Key bind ,ne - NERDTree
let mapleader = ","

nnoremap <A-n> :NERDTreeToggle<CR>
inoremap <A-n> <Esc>:NERDTreeToggle<CR>i
nnoremap <A-\> :IndentLinesToggle<CR>
noremap <F4> :set hlsearch! hlsearch?<CR>
hi Search ctermbg=26 guifg=#005fd7
"Key bind tab controll
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>
" for fzf
nnoremap <C-p> :Files<CR>

let mapleader=","

" easymotion
nmap  / <Plug>(easymotion-sn)
nmap  n <Plug>(easymotion-next)
nmap  N <Plug>(easymotion-prev)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_move_highlight = 0
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 0

nnoremap <A-r>   :source ~/.config/nvim/init.vim<cr>:echo "Reload nvim config"<cr>
nnoremap <A-e>   <Esc>:sp ~/.config/nvim/init.vim<cr>

" for ag
nnoremap <A-i> :Ag<cr>
nnoremap <A-o> :Buffers<cr>
" for Ansible
let g:ansible_options = {'ignore_blank_lines': 0}
let g:ansible_options = {'documentation_mapping': '<C-k>'}
" register
" you can copy the register value by <"-[register_code]>
inoremap <A-g> <C-o>:register<cr>
nnoremap <A-g> :register<cr>

" save
inoremap <A-s> <Esc>:w<cr>a
nnoremap <A-s> :w<cr>
" quick retab
nnoremap <A-t>   :set expandtab<cr>:retab<cr>:echo "Replace all tab to spaces"<cr>


" map to nop
map <C-q> <Nop>
" auto pop
let g:asyncomplete_auto_popup = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))
