" .vimrc

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

source ~/.vim/conf/options.vim
source ~/.vim/conf/functions.vim
source ~/.vim/conf/mappings.vim
source ~/.vim/conf/plugins.vim
source ~/.vim/conf/appearence.vim

" ------------------------------------------------------------------------------
" Calbacks
" ------------------------------------------------------------------------------

" clear whitespaces before saving
autocmd BufWritePre     * :call TrimWhiteSpace()

" ------------------------------------------------------------------------------
" Allow overriding these settings
" ------------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif