" Bootstrap vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'gruvbox-community/gruvbox'
Plug 'haya14busa/incsearch.vim'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'majutsushi/tagbar'
Plug 'markonm/traces.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'wincent/terminus'
call plug#end()

let mapleader = ","

" Hide buffers instead of closing them
set hidden

" Intuitive split opening
set splitbelow
set splitright

" Auto-toggle hybrid line numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END
set number relativenumber

" Fzf mappings
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>h :History<CR>
cnoremap <Leader>h :History:<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>t :Tags<CR>

" Execute current file from its directory in a tmux pane
nnoremap <silent><Leader>r :call VimuxRunCommandInDir('./' . fnamemodify(bufname('%'), ':t'), 0)<CR>
nnoremap <Leader>p :VimuxPromptCommand<CR>

" Incremental search highlighting and easymotion
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <silent><expr> <Leader>/ (&hlsearch && v:hlsearch ? ':nohlsearch' : ':set hlsearch')."\n"
set hlsearch
nmap <Space> <Plug>(easymotion-s)

" Eye candy
highlight Normal ctermbg=black ctermfg=white
set background=dark
colorscheme gruvbox
let g:lightline = {'colorscheme': 'gruvbox', 'active': { 'left': [ [ 'mode', 'paste' ],
	\ [ 'readonly', 'filename', 'modified', 'tagbar' ] ] },
	\ 'component': { 'tagbar': '%{tagbar#currenttag("%s", "", "f")}' } }
set colorcolumn=120
