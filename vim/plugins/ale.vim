let g:ale_lint_on_text_changed = 'never'
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'xd'
let g:ale_linters = {
  \ 'javascript': ['eslint']
\}
let g:ale_dockerfile_hadolint_use_docker = 'yes'
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ 'json': ['prettier'],
  \ 'ruby': ['rubocop'],
  \ 'rust': ['rustfmt']
\}
nnoremap <C-f> :ALEFix<CR>
