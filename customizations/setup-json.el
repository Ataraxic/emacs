;; json mode
(autoload 'json-mode "json-mode" "Major mode for json files" t)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
