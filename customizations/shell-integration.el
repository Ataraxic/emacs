;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

;; setup multi-term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")

;; Set lines kept to 10000
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))

(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("s-{" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("s-}" . multi-term-next))))

(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))
