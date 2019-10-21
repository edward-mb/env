

" setup plugins


call plug#begin()

" theme
Plug 'altercation/vim-colors-solarized'

" completion
function! DoNvimPluginUpdate(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoNvimPluginUpdate') }
  let g:deoplete#enable_at_startup = 1 " enable at startup
  "let g:deoplete#max_abbr_width = 0 " no width limit
  "let g:deoplete#max_menu_width = 0 " no width limit
  let g:deoplete#enable_smart_case = 1 " enable smart case
  "let g:deoplete#file#enable_buffer_path = 1
  set completeopt=menuone,longest
  "inoremap <silent><expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"

" git
Plug 'tpope/vim-fugitive'

" c, c++
Plug 'zchee/deoplete-clang', { 'for': [ 'c', 'cpp', 'h' ] }

" html, css
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'css', 'scss', 'vue', 'javascript' ] }
  let g:user_emmet_leader_key = '<C-t>'
  function! s:setup_emmet_shortcut()
    imap <expr> <C-e> emmet#expandAbbrIntelligent("\<C-e>")
  endfunction
  autocmd FileType html,css,scss,vue,javascript call s:setup_emmet_shortcut()

" javascript
Plug 'wokalski/autocomplete-flow', { 'for': [ 'javascript' ] }
Plug 'Quramy/vim-js-pretty-template', { 'for': [ 'javascript' ] }
  function! s:setup_prettytemplate()
    JsPreTmpl
  endfunction
  "autocmd FileType javascript call s:setup_prettytemplate()
  " Moved to plugin init
Plug 'posva/vim-vue', { 'for': [ 'vue' ] }

" go
function! BuildDeopleteGo(arg)
  :echom "install/update github.com/nsf/gocode"
  :silent !go get -u github.com/nsf/gocode
  :silent !make
endfunction
Plug 'zchee/deoplete-go', { 'for': [ 'go' ], 'do': function('BuildDeopleteGo') }
function! BuildVimGo(arg)
  :echom "install/update github.com/nsf/gocode"
  :silent !go get -u github.com/nsf/gocode
  :echom "install/update github.com/alecthomas/gometalinter"
  :silent !go get -u github.com/alecthomas/gometalinter
  :echom  "install/update golang.org/x/tools/cmd/goimports"
  :silent !go get -u golang.org/x/tools/cmd/goimports
  :echom "install/update golang.org/x/tools/cmd/guru"
  :silent !go get -u golang.org/x/tools/cmd/guru
  :echom "install/update golang.org/x/tools/cmd/gorename"
  :silent !go get -u golang.org/x/tools/cmd/gorename
  :echom "install/update github.com/golang/lint/golint"
  :silent !go get -u github.com/golang/lint/golint
  :echom "install/update github.com/kisielk/errcheck"
  :silent !go get -u github.com/kisielk/errcheck
  :echom "install/update github.com/jstemmer/gotags"
  :silent !go get -u github.com/jstemmer/gotags
  :echom "install/update github.com/klauspost/asmfmt/cmd/asmfmt"
  :silent !go get -u github.com/klauspost/asmfmt/cmd/asmfmt
  :echom "install/update github.com/fatih/motion"
  :silent !go get -u github.com/fatih/motion
  :echom "install/update github.com/zmb3/gogetdoc"
  :silent !go get -u github.com/zmb3/gogetdoc
  :echom "install/update github.com/josharian/impl"
  :silent !go get -u github.com/josharian/impl
endfunction
Plug 'fatih/vim-go', { 'for': [ 'go' ], 'do': function('BuildVimGo') }
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
  let g:go_term_enabled = 1
  autocmd FileType go call s:define_go_leader_mappings()
  function! s:define_go_leader_mappings()    
    " [r] Run go application
    nnoremap <silent> <Leader>r :<C-u>GoRun<CR>
    " [b] Build go application
    nnoremap <silent> <Leader>b :<C-u>GoBuild<CR>
  endfunction

call plug#end()


" main configuration


" plugin init

" javascript
autocmd FileType javascript JsPreTmpl

" mapping init

" disable arrow keys in normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <pageup> <nop>
map <pagedown> <nop>

" disable arrow keys in insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <pageup> <nop>
imap <pagedown> <nop>

" other init

" theme
set background=dark
if $LIGHT == 'true'
  set background=light
endif
let g:solarized_termtrans=1
silent! colorscheme solarized

" highlighting
highlight SpellBad cterm=undercurl

" numbering
set number
highlight LineNr ctermfg=239 ctermbg=none

" cursor and line
set cursorline
highlight CursorLine ctermbg=none
highlight CursorLineNR cterm=bold ctermfg=244

" indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4

" hidden characters
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

" file browser
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=25

" spellcheck
set spell spelllang=en_gb

" vim: set expandtab ts=2 sw=2:

