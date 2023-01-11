(fn use [mod names]
  (assert-compile (sym? mod) "expected symbol" mod)
  (let [mod-name (view mod)
        splitted (vim.split mod-name "." {:plain true})
        last (. splitted (length splitted))
        matcher (if (= names nil) (sym last) names)]
    `(local ,matcher (require ,mod-name))))

(fn reuse [mod names]
  (assert-compile (sym? mod) "expected symbol" mod)
  (let [mod-name (view mod)
        splitted (vim.split mod-name "." {:plain true})
        last (. splitted (length splitted))
        matcher (if (= names nil) (sym last) names)]
    `(local ,matcher
            (do
              (tset _G.reloadable (+ (length _G.reloadable)) ,mod-name)
              (require ,mod-name)))))

{: use : reuse}
