runtime! syntax/c.vim

" Highlight function calls
syntax match cFunction /\(\(\<void\>.*\|\<int\>.*\|\<char\>.*\|\<bool\>.*\|\<double\>.*\|\<float\>.*\|\<long\>.*\|\<short\>.*\|\<size_t\>.*\)\@<!\k\+\)\((\)\@=/
syntax match cCustomType /\zst_\w*[^;]/
syntax match cCustomOperator /++\|--/
