" Only enable flake8 for python
let b:ale_linters = ['flake8']
" Disable some annoying flake8 lints
let g:ale_python_flake8_options = '--max-line-length=120'
