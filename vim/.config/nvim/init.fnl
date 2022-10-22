(import-macros {: use} :relude)

(use nvim {
     : map
     : command
     : executable?
     : func
     : api
     : opts
     : ex})
(use picker)
(import-macros {: augroup
               : defcommand} :nvim)

(require :plugins)

; Colors
(ex.colorscheme :blame)

(set opts.shell "fish")

; MatchIt must be unloaded for MatchPair to work correctly
(set vim.g.loaded_matchit true)
(set vim.g.matchup_surround_enabled true)

(set vim.g.choosewin_label "QWERTYUIOP")

; Colors
(opts {:termguicolors true
      :guicursor ["n-v-c-sm:block-Cursor" "i-ci-ve:ver25-Cursor" "r-cr-o:hor20-Cursor"]})

; Indentation
(opts {:shiftwidth 2
      :expandtab true
      :textwidth 80
      :wrap false
      :linebreak true
      :formatoptions "tcqjl"})

; UI
(opts {:lazyredraw true
      :updatetime 500
      :title true})

; Display tabs and trailing spaces visually
(opts {:fillchars ["vert:┃" "fold:·"]
      :list true
      :listchars ["tab:→ " "trail:·" "nbsp:␣" "extends:↦" "precedes:↤"]
      :conceallevel 2})

; Ignore case. If your code uses different casing to differentiate files, then
; you need mental help
(opts {:wildignorecase true
      :wildmode :full
      :fileignorecase true
      :wildignore ["*.o"
                   "*~"
                   "**/.git/**"
                   "**/tmp/**"
                   "**/node_modules/**"
                   "**/_build/**"
                   "**/deps/**"
                   "**/target/**"
                   "**/uploads/**"
                   "*.lock"]})

(opts {:diffopt+ ["indent-heuristic" "algorithm:patience"]
      :tags^ ["./**/tags"]
      :iskeyword+ ["-"]})

(set opts.showmode false)

; Autowrite file whenever possible
(opts {:hidden false
      :autowriteall true})

; Keep cursor in the middle
(let [value 9999]
  (set opts.scrolloff value)
  (augroup terminal-scrolloff
           (on BufEnter "term://*" (set opts.window.scrolloff 0))
           (on BufLeave "term://*" (set opts.window.scrolloff value))))

; XXI century - we have cursors now
(set opts.mouse :a)

; Split in CORRECT places
(opts {:splitright true
      :splitbelow true})

; Searching
(opts {:ignorecase true
      :smartcase true
      :inccommand :nosplit})

; Permanent undo
(set opts.undofile true)

; Save only meaningfull data to sessions
(set opts.sessionoptions [:blank :buffers :curdir :folds :tabpages :winsize :terminal])

; Folding
(opts {:foldmethod :expr
      :foldexpr "nvim_treesitter#foldexpr()"
      :foldlevel 999})
(map :n :<CR> "foldlevel(\".\") ? \"za\" : \"\\<CR>\"" {:expr true})

; Completion
(opts {:complete [:. :w :b :t :k :kspell]
      :completeopt [:menuone :noselect :noinsert]})

; Clap
(map :n :<Space><Space>
     #(picker.find_files))

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
(map :n :gq (fn []
              (let [name (func.expand "<cfile>")]
                (func.jobstart ["open" name] {:detach true})
                (print "Open" name))))

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
(map :i "<C-q>" "<ESC>")
(map :n "<C-q>" "<ESC>")

(when (executable? "nvr")
  (set vim.env.EDITOR "nvr -cc split -c 'set bufhidden=delete' --remote-wait"))

; Git mappings
(let [leader "U"
             git-map (fn [lhs cmd] (map :n (.. leader lhs) (.. ":Git " cmd)))]
  (map :n leader "<nop>")
  (map :n (.. leader leader) (.. leader :u) {:noremap false})
  (git-map :p "push")
  (git-map :s "")
  (git-map :d "diff")
  (git-map :B "blame")
  (git-map :c "commit")
  (git-map :u "pull")
  (git-map :g "log"))

; Split management
(map :n "<C-w><C-w>" "<plug>(choosewin)" {:noremap false})
(map :n "<C-_>" "<plug>(choosewin)" {:noremap false})

; Search
(when (executable? "rg")
  (opts {:grepprg "rg --vimgrep --no-heading --smart-case"
        :grepformat "%f:%l:%c:%m,%f:%l%m,%f  %l%m"}))

; Matchparen
(set vim.g.matchup_matchparen_offscreen {:method :popup})

(augroup matchparen
         (let [term "term://*"]
           (on BufEnter term (ex.NoMatchParen))
           (on BufLeave term (ex.DoMatchParen))))

; Autoreload Direnv after writing the .envrc
(when (executable? "direnv")
  (augroup autoreload-envrc
           (on BufWritePost ".envrc" (ex.silent "!direnv allow %"))))

; Setup Lua extensions
(let [setup (fn [package object] ((. (require package) :setup) object))]
  (setup :startify
         {:lists [{:type "sessions" :header ["   Sessions"]}
                  {:type "commands" :header ["   Wiki"]}]
         :session-dir "~/.local/share/nvim/site/sessions/"
         :session-autoload true
         :session-persistence true
         :change-to-dir false
         :change-to-vcs-root true
         :fortune-use-unicode true})
  (setup :nvim-treesitter.configs
         {:highlight {:enable true}
         :matchup {:enable true}
         :indent {:enable true}})
  (setup :fidget {})
  ; (setup :orgmode {})
  )

(: (require :presence) :setup
   {:auto_update true
   :buttons false
   :blacklist ["Workspace/forte"]})

(defcommand Bd "b#|bd#")
(defcommand BClean
            (->> (func.getbufinfo {:buflisted true})
                 (vim.tbl_filter #(= (next $1.windows) nil))
                 (#(each [_ v (ipairs $1)]
                     (api.buf_delete v.bufnr {})))))
(defcommand Clean "keeppatterns %s/\\s\\+$//e | set nohlsearch")

; Async Make and Grep
(let [run (fn [args f-args]
            (api.call_function :asyncdo#run (vim.list_extend args f-args)))]
  (defcommand Make {:bang true :nargs :* :complete :file}
              (run [bang opts.makeprg] f-args))
  (defcommand Grep {:bang true :nargs :+ :complete :dir}
              (run [bang {:job opts.grepprg :errorformat opts.grepformat}] f-args)))

(defcommand Ctags
            (ex.AsyncDo "ctags -R ."))
(defcommand Start {:nargs :*}
            (let [cmd (func.expand q-args)]
              (command (.. mods " new"))
              (func.termopen cmd)
              (ex.startinsert)))
(defcommand Dash {:nargs :?}
            (func.dash#open q-args))

(do
  (ex.packadd! :vim-sandwich)
  (ex.runtime "macros/sandwich/keymap/surround.vim"))

(require :startify)
(require :langclient)
