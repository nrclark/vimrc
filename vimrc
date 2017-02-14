 " Basic  VIM environment options
    set nocompatible             " Must be first line.
    set title                    " Places the active file in the Term title.
    set titleold=""              " Restores the title afterwards.
    set mouse=a                  " Set automatic mouse use.
    set noerrorbells             " I find that they "trip out my flow"
    set visualbell               " Visual flashes might be preferable.
    set fileformats=unix,dos,mac " It's nice to read old Mac-OS files.
    filetype plugin indent on    " Enables filetype-specific behaviors.

    set autoread                 " Enables a quasi-automatic reload when a file
                                 " changes externally. :checktime must still
                                 " be issued to perform the scan/reload.

" Backup Options and Temporary Files
    set backup                           " Enables backups.
    set backupdir=$HOME/.vim/backup      " Use .vim for housekeeping. 
    set dir=$HOME/.vim/swap              " Use .vim for housekeeping.
    set viewdir=$HOME/.vim/view          " Use .vim for housekeeping.
    set backupskip=/tmp/*,/private/tmp/* " Skip the backups of temp files like crontab.

" Programming options
    syntax on           " Enables syntax highlighting.
    set expandtab       " Configures [Tab] in Insert mode to produce spaces.
    set softtabstop=4   " Sets the width of the [Tab] key.
    set tabstop=4       " Sets the width of a TAB character.
    set shiftwidth=4    " Sets the width of auto/re-/de-indent operations.
    
    set autoindent      " Enables auto-indenting. Don't add [smart/c] indent!

" Visual Options
    set t_Co=256        " Sets Vim to be 256-color. I rarely work in other environments.
    set number          " Turns on Line Numbers.
    set ruler           " Turns on the X,Y cursor.
    set nowrap          " Disables line-wraps.
    set showmatch       " show matching brackets/parenthesis
    
" Color Scheme Options

    if has('gui_running')
        set background=light
        colorscheme solarized
        set lines=50 columns=100
    else
        set background=dark
        colorscheme default
    endif

" OS-Specific Options

    if MySys() == "windows"
      set guifont=Consolas:h11

    elseif MySys() == "os-x"
      set gfn=Monaco:h12
      set shell=/bin/bash

    elseif MySys() == "linux"
      set guifont=Monospace
      set shell=/bin/bash
      colorscheme oceandeep
    endif

    if ColorScheme() == "light"
	set background=light
    else
       set background=dark
    endif

" Editing Options    
    set history=1000
    set wildmenu
    set wildmode=longest:full
    set incsearch                   " Enables find-while-searching.
    set hlsearch                    " Highlights search terms.
    set ignorecase                  " Makes search be case-insensitive.
    " ignorecase can be circumvented by adding \c to the end of a search
    " query for case-insensitive or \C at the end for case-sensitive.

    set smartcase                   " case sensitive when uc
    set backspace=indent,eol,start  " Adds extra backspaceble things.
  
    set whichwrap+=<,>  " allows the left/right arrow keys to skip a line break

" Key Remaps

    " This maps Shift+Tab to work as unindent in Insert mode.
    inoremap <s-tab> <Esc>v<i
    set timeout " This ensures that multi-key remaps will timeout.
    set timeoutlen=175 " Sets the Multi-key remap timeout to 175ms. This is experimentally OK.
    
    " gives us a convenient exit from insert mode.
    inoremap ii <Esc>

    " Maps TAB/shift+TAB to indent/unindent and return to visual.
    vnoremap <s-tab> <gv
    vnoremap <tab> >gv

    nnoremap <F2> :set invpaste paste?<CR>
    set pastetoggle=<F2>
    set showmode

    nnoremap <s-tab> v<
    nnoremap <tab> v>

" Filetype-specific things

    autocmd FileType make setlocal noexpandtab


