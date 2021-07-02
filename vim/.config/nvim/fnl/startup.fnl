(local {: map
        : command
        : executable?
        : call
        : api
        : get-opt
        : ex} (require :nvim))
(local picker (require :picker))
(import-macros logger :nvim.logger)
(import-macros {: augroup
                : defcommand
                : on
                : env
                : g
                : opt
                : bopt
                : wopt} :nvim.macros)

; Colors
(ex.colorscheme :blame)

(opt shell "fish")

; MatchIt must be unloaded for MatchPair to work correctly
(g :loaded_matchit true)

; Colors
(opt termguicolors)
(opt guicursor "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor")

; Indentation
(opt shiftwidth 2)
(opt expandtab)
(bopt expandtab)
(opt textwidth 80)
(wopt wrap false)
(wopt linebreak)
(opt formatoptions "tcqjl")

; UI
(opt lazyredraw)
(opt updatetime 500)
(opt title)

; Display tabs and trailing spaces visually
(opt fillchars "vert:┃,fold:·")
(opt list)
(opt listchars "tab:→ ,trail:·,nbsp:␣,extends:↦,precedes:↤")
(opt conceallevel 2)

; Ignore case. If your code uses different casing to differentiate files, then
; you need mental help
(opt wildignorecase)
(opt wildmode :full)
(opt fileignorecase)
(opt wildignore "*.o,*~,**/.git/**,**/tmp/**,**/node_modules/**,**/_build/**,**/deps/**,**/target/**,**/uploads/**,*.lock")

(opt diffopt+ "indent-heuristic,algorithm:patience")
(opt tags^ "./**/tags")
(opt iskeyword+ "-")

(opt showmode false)

; Autowrite file whenever possible
(opt hidden false)
(opt autowriteall)

; Keep cursor in the middle
(let [value 9999]
  (opt scrolloff value)
  (augroup terminal-scrolloff
           (on BufEnter "term://*" (wopt scrolloff 0))
           (on BufLeave "term://*" (wopt scrolloff value))))

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

(g :echodoc#enable_at_startup true)
(g :echodoc#type :virtual)

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
              (let [name (call :expand "<cfile>")]
                (call :jobstart ["open" name] {:detach true})
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
  (env EDITOR "nvr -cc split -c 'set bufhidden=delete' --remote-wait"))

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
  (opt grepprg "rg --vimgrep --no-heading --smart-case")
  (opt grepformat "%f:%l:%c:%m,%f:%l%m,%f  %l%m"))

; Matchparen
(g :matchup_matchparen_offscreen {:method :popup})

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
  (setup :nvim-treesitter.configs
         {:ensure_installed [:erlang
                             :elixir
                             :nix
                             :typescript
                             :javascript
                             :c
                             :json
                             :fennel
                             :html
                             :css
                             :yaml
                             :rust
                             :toml]
          :highlight {:enable true
                      ; :disable [:elixir]
                      }
          :indent {:enable true}})
  (setup :startify
         {:lists [{:type "sessions" :header ["   Sessions"]}
                  {:type "commands" :header ["   Wiki"]}]
          :session-dir "~/.local/share/nvim/site/sessions/"
          :session-autoload true
          :session-persistence true
          :commands [{:w ["Wiki" "VimwikiIndex"]}
                     {:d ["Diary" "VimwikiDiaryIndex"]}
                     {:t ["Today" "VimwikiMakeDiaryNote"]}
                     {:y ["Yesterday" "VimwikiMakeYesterdayDiaryNote"]}
                     {:a ["Tomorrow" "VimwikiMakeTomorrowDiaryNote"]}]
          :change-to-dir false
          :change-to-vcs-root true
          :fortune-use-unicode true}))

; Minpac actions
(defcommand PackUpdate {:bar true}
  (call :plugins#reload)
  (call :minpac#update))
(defcommand PackClean  {:bar true}
  (call :plugins#reload)
  (call :minpac#clean))
(defcommand PackStatus {:bar true}
  (call :plugins#reload)
  (call :minpac#status))

(defcommand Bd "b#|bd#")
(defcommand BClean
  (->> (call :getbufinfo {:buflisted true})
       (vim.tbl_filter #(= (next $1.windows) nil))
       (#(each [_ v (ipairs $1)]
           (command (.. "bd " v.bufnr))))))
(defcommand Clean "keeppatterns %s/\\s\\+$//e | set nohlsearch")

; Async Make and Grep
(let [run (fn [args f-args]
            (api.call_function :asyncdo#run (vim.list_extend args f-args)))]
  (defcommand Make {:bang true :nargs :* :complete :file}
    (run [bang (get-opt :makeprg)] f-args))
  (defcommand Grep {:bang true :nargs :+ :complete :dir}
    (run [bang {:job (get-opt :grepprg) :errorformat (get-opt :grepformat)}] f-args)))

(defcommand Ctags
  (command :AsyncDo "ctags -R ."))
(defcommand Start {:nargs :*}
  (let [cmd (call :expand q-args)]
    (command (.. mods " new"))
    (call :termopen cmd)
    (ex.startinsert)))
(defcommand Dash  {:nargs :?}
  (call :dash#open q-args))

(do
  (ex.packadd! :vim-sandwich)
  (ex.runtime "macros/sandwich/keymap/surround.vim"))

(require :startify)
(require :langclient)
