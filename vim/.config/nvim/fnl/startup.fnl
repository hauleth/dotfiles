(local {:map map} (require :utils))
(local ts (require :nvim-treesitter.configs))

(macro g [name value] `(tset vim.g ,name ,value))
(macro opt [name value]
  (assert (sym? name))
  `(tset vim.o ,(view name) ,(if (= nil value) true value)))
(macro wopt [name value]
  (assert (sym? name))
  `(tset vim.wo ,(view name) ,(if (= nil value) true value)))

(macro on [event pattern cmd]
  `(vim.api.nvim_command (.. "au " ,(view event) " " ,pattern " " ,cmd)))

(macro augroup [name ...]
  (let [f (sym "on")]
  `(do
    (vim.api.nvim_command (.. "augroup " ,(view name)))
    (vim.api.nvim_command "au!")
    ,...
    (vim.api.nvim_command "augroup END"))))

(fn executable? [name]
  (vim.api.nvim_call_function "executable" [name]))

(fn colorscheme [name]
  (vim.api.nvim_command (.. "colorscheme " name)))

; Colors
(colorscheme :blame)

(opt shell "fish")

; MatchIt must be unloaded for MatchPair to work correctly
(g :loaded_matchit true)

; Colors
(opt termguicolors)
(opt guicursor "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor")

; Indentation
(opt shiftwidth 2)
(opt expandtab)
(opt textwidth 80)
(wopt wrap false)
(wopt linebreak)
(opt formatoptions "tcqjl")

; UI
(opt lazyredraw)
(opt updatetime 500)
(opt title)

; Display tabs and trailing spaces visually
; (opt fillchars "vert:┃,fold:·")
(opt list)
; (opt listchars "tab:→\ ,trail:·,nbsp:␣,extends:↦,precedes:↤")
(opt conceallevel 2)

; Ignore case. If your code uses different casing to differentiate files, then
; you need mental help
(opt wildignorecase)
(opt wildmode :full)
(opt fileignorecase)

(opt showmode false)

; Autowrite file whenever possible
(opt hidden false)
(opt autowriteall)

; Keep cursor in the middle
(let [value 9999
      scrolloff (fn [v] (.. "silent setl scrolloff=" v))]
  (opt scrolloff value)
  (augroup terminal_scrolloff
           (on BufEnter "term://*" (scrolloff 0))
           (on BufLeave "term://*" (scrolloff value))))

; XXI century - we have cursors now
(opt mouse :a)

; Split in CORRECT places
(opt splitright)
(opt splitbelow)

; Searching
(opt ignorecase)
(opt smartcase)
(opt inccommand :nosplit)

; Permanent undo
(opt undofile)

; Save only meaningfull data to sessions
(opt sessionoptions "blank,buffers,curdir,folds,tabpages,winsize")

; Folding
(opt foldmethod :syntax)
(opt foldlevel 999)
(map :n :<CR> "foldlevel(\".\") ? \"za\" : \"\\<CR>\"" {:expr true})

; Completion
(opt complete ".,w,b,t,k,kspell")
(opt completeopt "menuone,noselect,noinsert")

(g "echodoc#enable_at_startup" true)
(g "echodoc#type" :virtual)

; Clap
(map :n :<Space><Space> ":Clap files")

; Frequently used unimpaired mappings
(let [unimpaired (fn [char left right]
                   (map :n (.. "[" char) left)
                   (map :n (.. "]" char) right))]
  (unimpaired :w "gT" "gt")
  (unimpaired :q ":cprev"  ":cnext")
  (unimpaired :Q ":cpfile" ":cnfile")
  (unimpaired :l ":lprev"  ":lnext")
  (unimpaired :L ":lpfile" ":lnfile"))

; Additional "Close" commands
(map :n :ZS ":wa")
(map :n :ZA ":qa")
(map :n :ZX ":cq")

; Swap ; and : for easier command line mode
(let [swap (fn [a b] (map :nx a b) (map :nx b a))]
  (swap ";" ":")
  (map :n "q;" "q:"))

; Expand abbreviation when hitted <CR>
(map :i :<CR> "<C-]><CR>")

; Make Vim behaviour consistent
(map :n :Y :y$)

; Code formatting
(map :n :g= "=aGg``")
(map :nx :Q "gq")
(map :n :gQ "gqaG``")

; Smart `0`
; Goes to the beginning of the text at first and later goes to the beginning of
; the line, alternates afterwards
(map :n :0 "virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'" {:expr true})

(map :n :gK ":Dash")
(map :n :gq ":call open#open()")

; Text object for whole file
(map :o :aG ":normal! ggVG")

; Quickly disable highligh
(map :n "<Space>," ":nohlsearch")

; Terminal mappings
(map :n "<C-q>" "<Nop>")
(map :n "<C-q>c" ":term")
(map :n "<C-q>s" ":split +term")
(map :n "<C-q>v" ":vsplit +term")
(map :n "<C-q>t" ":tabnew +term")

(map :t "<C-q>" "<C-\\><C-n>")
(map :n "<C-q>" "<ESC>")

; Git mappings
(let [leader "U"
      git-map (fn [lhs cmd] (map :n (.. leader lhs) (.. ":Git " cmd)))]
  (map :n leader "<nop>")
  (map :n (.. leader leader) (.. leader :u) {:noremap false})
  (git-map :p "push")
  (git-map :s "status")
  (git-map :d "diff")
  (git-map :B "blame")
  (git-map :c "commit")
  (git-map :u "pull")
  (git-map :g "log"))

; Split management
(augroup align-windows
         (on VimEnter "*" "wincmd ="))
(map :n "<C-w>q" "<plug>(choosewin)")
(map :n "<C-_>" "<plug>(choosewin)")

; Search
(when (executable? "rg")
  (opt grepprg "rg --vimgrep --no-heading --smart-case")
  (opt grepformat "%f:%l:%c:%m,%f:%l%m,%f  %l%m"))

; Matchparen
(g :matchup_matchparen_offscreen {:method :popup})

(augroup matchparen
         (let [term "term://*"]
           (on BufEnter term "NoMatchParen")
           (on BufLeave term "DoMatchParen")))

; Autoreload Direnv after writing the .envrc
(when (executable? "direnv")
  (augroup autoreload-envrc
           (on BufWritePost ".envrc" "silent !direnv allow %")))

; Clean non-existing buffers on leave
(augroup autoclean
         (on BufLeave "*" "call utils#cleanup()"))

(ts.setup {:ensure_installed :maintained
           :highlight {:enable true}
           :indent {:enable true}})

(require :langclient)
