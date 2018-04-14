""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt-=preview
let g:ycm_global_ycm_extra_conf = $HOME . '/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = []
let g:ycm_always_populate_location_list = 0
let g:ycm_auto_trigger = 1
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_max_diagnostics_to_display = 10000
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_blacklist = {
    \ 'vim': 1,
    \ 'markdown': 1,
\ }
let g:ycm_semantic_triggers =  {
    \ 'c' : ['->', '.','re![_a-zA-z0-9]{2,}'],
    \ 'cpp' : ['->', '.', '::','re![_a-zA-Z0-9]{2,}'],
\ }

nnoremap <silent> <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>gg :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <silent> <leader>gt :YcmCompleter GetType<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => DelimitMate
""""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_matchpairs = "(:),[:],{:}"
au FileType cpp,vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SuperTab
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType = 2


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDChristmasTree = 0
let NERDTreeWinSize = 30
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks = 1
let NERDTreeWinPos = 'right'


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDcommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" help doc -> tagbar.txt && ctags config file
let g:tagbar_type_lua = {
    \ 'ctagstype' : 'LUAA',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'v:variables',
    \ ],
\ }


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-markology
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markology_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gb :Gblame<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_highlight_lines = 0
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '--'


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Toggle
""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F4> :TagbarToggle<CR>
nmap <F5> :NERDTreeToggle<CR>
