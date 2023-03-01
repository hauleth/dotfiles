(import-macros {: use} :relude)
(use nvim {: fun})

(use plenary.curl)

(local xps {})

(fn profile [user]
  (let [res (curl.get (.. "https://codestats.net/api/users/" user))]
    (print (fennel.view res))
    (when (= res.status 200)
      (fun.json_decode res.body))))

(fn add-xp [ft xp]
  (tset xps ft (+ (if (= nil (. xps ft)) 0 (. xps ft)) xp)))

{: profile : add-xp}
