(import-macros {: use} :relude)

(use nvim {: map : fun : api : opt : cmd})

(use picker)
(import-macros {: augroup : defcommand} :nvim)

(require :plugins)

(set opt.shell :fish)

(do ; MatchIt must be unloaded for MatchPair to work correctly
  (set vim.g.loaded_matchit true)
  (set vim.g.matchup_surround_enabled true))

(set vim.g.choosewin_label :QWERTYUIOP)

(do ; Colors
  (cmd.colorscheme :blame)
  (opt {:termguicolors true
         :guicursor ["n-v-c-sm:block-Cursor"
                     "i-ci-ve:ver25-Cursor"
                     "r-cr-o:hor20-Cursor"]}))

(do ; Indentation
  (opt {:shiftwidth 2
         :expandtab true
         :textwidth 80
         :wrap false
         :linebreak true
         :formatoptions :tcqjl}))

(do ; UI
  (opt {:lazyredraw true :updatetime 500 :title true :showmode true}))

(do ; Display tabs and trailing spaces visually
  (opt {:fillchars ["vert:┃" "fold:·"]
         :list true
         :listchars ["tab:→ "
                     "trail:·"
                     "nbsp:␣"
                     "extends:↦"
                     "precedes:↤"]
         :conceallevel 2
         :concealcursor :nc}))

(do ; Ignore case.
  ; If your code uses different casing to differentiate files, then you need
  ; mental help
  (opt {:wildignorecase true
         :wildmode :full
         :fileignorecase true
         :wildignore [:*.o
                      "*~"
                      :**/.git/**
                      :**/tmp/**
                      :**/node_modules/**
                      :**/_build/**
                      :**/deps/**
                      :**/target/**
                      :**/uploads/**
                      :*.lock]}))

(opt {:diffopt+ [:indent-heuristic "algorithm:patience"]
       :tags^ [:./**/tags]
       :iskeyword+ ["-"]})

(do ; Autowrite file whenever possible
  (opt {:hidden false :autowriteall true}))

(do
  ; Keep cursor in the middle
  (let [value 9999]
    (set opt.scrolloff value)
    (augroup terminal-scrolloff
             (on BufEnter "term://*" (set opt.window.scrolloff 0))
             (on BufLeave "term://*" (set opt.window.scrolloff value)))))

(do ; XXI century - we have cursors now
  (set opt.mouse :a))

(do ; Split in CORRECT places
  (opt {:splitright true :splitbelow true}))

(do ; Searching
  (opt {:ignorecase true :smartcase true :inccommand :nosplit}))

(do ; Permanent undo
  (set opt.undofile true))

(do ; Save only meaningfull data to sessions
  (set opt.sessionoptions [:blank
                            :buffers
                            :curdir
                            :folds
                            :tabpages
                            :winsize
                            :terminal]))

(do ; Folding
  (opt {:foldmethod :expr
         :foldexpr "nvim_treesitter#foldexpr()"
         :foldlevel 999})
  (map :n :<CR> "foldlevel(\".\") ? \"za\" : \"\\<CR>\"" {:expr true}))

(do ; Completion
  (opt {:complete ["." :w :b :t :k :kspell]
         :completeopt [:menuone :noselect :noinsert]}))

(do ; Clap
  (map :n :<Space><Space> #(picker.find_files)))

(do ; Frequently used unimpaired mappings
  (let [unimpaired (fn [char left right]
                     (map :n (.. "[" char) left)
                     (map :n (.. "]" char) right))]
    (unimpaired :w :gT :gt)
    (unimpaired :q ":cprev" ":cnext")
    (unimpaired :Q ":cpfile" ":cnfile")
    (unimpaired :l ":lprev" ":lnext")
    (unimpaired :L ":lpfile" ":lnfile")))

(do ; Additional "Close" commands
  (map :n :ZS ":wa")
  (map :n :ZA ":qa")
  (map :n :ZX ":cq"))

(do ; Swap ; and : for easier command line mode
  (let [swap (fn [a b]
               (map :nx a b)
               (map :nx b a))]
    (swap ";" ":")
    (map :n "q;" "q:")))

(do ; Expand abbreviation when hitted <CR>
  (map :i :<CR> "<C-]><CR>"))

(do ; Make Vim behaviour consistent
  (map :n :Y :y$))

(do ; Code formatting
  (map :n :g= "=aGg``")
  (map :nx :Q :gq)
  (map :n :gQ "gqaG``"))

(do ; Smart `0`
  ; Goes to the beginning of the text at first and later goes to the beginning of
  ; the line, alternates afterwards
  (map :n :0 "virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'"
       {:expr true}))

(do ; Help viewing and opening URLs
  (map :n :gK ":Dash")
  (map :n :gq (fn []
                (let [name (fun.expand :<cfile>)]
                  (fun.jobstart [:open name] {:detach true})
                  (print :Open name)))))

(do ; Text object for whole file
  (map :o :aG ":normal! ggVG"))

(do ; Quickly disable highligh
  (map :n "<Space>," ":nohlsearch"))

(do ; Terminal mappings
  (map :n :<C-q> :<Nop>)
  (map :n :<C-q>c ":term")
  (map :n :<C-q>s ":split +term")
  (map :n :<C-q>v ":vsplit +term")
  (map :n :<C-q>t ":tabnew +term")
  (map :t :<C-q> "<C-\\><C-n>")
  (map :i :<C-q> :<ESC>)
  (map :n :<C-q> :<ESC>)
  (when (fun.executable :nvr)
    (set vim.env.EDITOR "nvr -cc split -c 'set bufhidden=delete' --remote-wait")))

(do ; Git mappings
  (let [leader :U
        git-map (fn [lhs cmd]
                  (map :n (.. leader lhs) (.. ":Git " cmd)))]
    (map :n leader :<nop>)
    (map :n (.. leader leader) (.. leader :u) {:noremap false})
    (git-map :p :push)
    (git-map :s "")
    (git-map :d :diff)
    (git-map :B :blame)
    (git-map :c :commit)
    (git-map :u :pull)
    (git-map :g :log)))

(do ; Split management
  (map :n :<C-w><C-w> "<plug>(choosewin)" {:noremap false})
  (map :n :<C-_> "<plug>(choosewin)" {:noremap false}))

(do ; Search
  (when (fun.executable :rg)
    (opt {:grepprg "rg --vimgrep --no-heading --smart-case"
           :grepformat "%f:%l:%c:%m,%f:%l%m,%f  %l%m"})))

(do ; Matchparen
  (set vim.g.matchup_matchparen_offscreen {:method :popup})
  (augroup matchparen
           (let [term "term://*"]
             (on BufEnter term (cmd.NoMatchParen))
             (on BufLeave term (cmd.DoMatchParen)))))

(do ; Autoreload Direnv after writing the .envrc
  (when (fun.executable :direnv)
    (augroup autoreload-envrc
             (on BufWritePost :.envrc (fun.system ["direnv" "allow" (fun.expand "%")])))))

(do ; Setup Lua extensions
  (let [setup (fn [package config]
                (let [lib (require package)
                      f (. lib :setup)
                      opts (match (type config)
                             :nil {}
                             :function (config lib)
                             :table config)]
                  (f opts)))]
    (setup :mini.starter (fn [starter]
                           {:items [(starter.sections.sessions 10 true)
                                    (starter.sections.builtin_actions)]}))
    (setup :mini.sessions {:directory "~/.local/share/nvim/site/sessions/"})
    (setup :mini.align {:mappings {:start :gl
                                   :start_with_preview :gL}})
    (setup :mini.comment)
    (setup :mini.ai)
    (setup :mini.jump {:mappings {:repeat_jump ":"}})
    (setup :mini.surround
           {:mappings {:add :ys
                       :delete :ds
                       :find ""
                       :find_left ""
                       :highlight ""
                       :replace :cs
                       :update_n_lines ""}})
    (setup :nvim-treesitter.configs
           {:highlight {:enable true}
            :matchup {:enable true}
            :indent {:enable true}})
    (setup :fidget {})) ; Presence requires to call `:setup` instead of `.setup
  (: (require :presence) :setup
     {:auto_update true :buttons false :blacklist [:Workspace/forte]}))

(defcommand Bd "b#|bd#")
(defcommand BClean (->> (fun.getbufinfo {:buflisted true})
                        (vim.tbl_filter #(= (next $1.windows) nil))
                        (#(each [_ v (ipairs $1)]
                            (api.buf-delete v.bufnr {})))))

(defcommand Clean "keeppatterns %s/\\s\\+$//e | set nohlsearch")

(do ; Async Make and Grep
  (let [run (fn [args f-args]
              (api.call-function "asyncdo#run" (vim.list_extend args f-args)))]
    (defcommand Make {:bang true :nargs "*" :complete :file}
                (run [bang opt.makeprg] f-args))
    (defcommand Grep {:bang true :nargs "+" :complete :dir}
                (run [bang {:job opt.grepprg :errorformat opt.grepformat}]
                     f-args))))

(defcommand Ctags (cmd.AsyncDo "ctags -R ."))

(defcommand Start {:nargs "*"}
            (let [command (fun.expand q-args)]
              (cmd.new {:mods smods})
              (fun.termopen command)
              (cmd.startinsert)))

(defcommand Dash {:nargs "?"} (fun.dash#open q-args))

(require :startify)
(require :langclient)
