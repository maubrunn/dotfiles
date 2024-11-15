set number
set relativenumber
set backspace=indent,eol,start

call plug#begin()
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
call plug#end()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

if executable('rust-analyzer')
	au User lsp_setup call lsp#register_server({
		\   'name': 'Rust Language Server',
		\   'cmd': {server_info->['rust-analyzer']},
		\   'whitelist': ['rust'],
		\ })
endif

if executable('bash-language-server')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'bash-language-server',
		\ 'cmd': {server_info->['bash-language-server', 'start']},
		\ 'allowlist': ['sh', 'bash'],
		\ })
endif
