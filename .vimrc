" Syntax highlight
syntax on

" Color scheme
colorscheme dusk 

" Runtime Path
set runtimepath+=~/.vim/bundle/swift.vim

" Diplay line number
set nu 

" Split navigations shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set nocompatible              " required
filetype off                  " required
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" pathogen.vim
execute pathogen#infect()

" Golang
set autowrite
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" run :GoBuild or :GoTestCompile based on the go file
 function! s:build_go_files()
   let l:file = expand('%')
     if l:file =~# '^\f\+_test\.go$'
         call go#test#Test(0, 1)
           elseif l:file =~# '^\f\+\.go$'
               call go#cmd#Build(0)
                 endif
                 endfunction

                 autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>


" Navigating between errors in quickfix list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Golang syntax highlight
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

