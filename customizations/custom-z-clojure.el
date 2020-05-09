(require 'clojure-mode)
(require 'cider)

;; a great lisp coding hook
(defun custom-clojure-mode-defaults ()
  (subword-mode +1)
  (parinfer-mode t)
  (rainbow-delimiters-mode +1))

(with-eval-after-load 'clojure-mode
  (setq custom-clojure-mode-hook 'custom-clojure-mode-defaults)
  (add-hook 'clojure-mode-hook (lambda ()
                                 (run-hooks 'custom-clojure-mode-hook))))

(with-eval-after-load 'cider
  (setq nrepl-log-messages t)

  (add-hook 'cider-mode-hook 'eldoc-mode)

  (defun custom-cider-repl-mode-defaults ()
    (subword-mode +1)
    (run-hooks 'custom-interactive-lisp-coding-hook))

  (setq custom-cider-repl-mode-hook 'custom-cider-repl-mode-defaults)

  (add-hook 'cider-repl-mode-hook (lambda ()
                                    (run-hooks 'custom-cider-repl-mode-hook))))


