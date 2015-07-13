;; javascript / html
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

;;Shell scripts running node.js
(add-to-list 'interpreter-mode-alist '("node" . js-mode))

;;Uses spaces isntead of tabs
(setq-default indent-tabs-mode nil)

(add-hook 'js-mode-hook 'js2-minor-mode)


(setq-default js2-basic-offset 2)
(setq js2-highlight-level 3)
(setq js-indent-level 2)

;;Tern
(add-to-list 'load-path "~/../../usr/local/lib/node_modules/tern/emacs")

(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js-mode-hook 'auto-complete-mode)

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))


;;paredit
(defun my-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))

;;paredit
(add-hook 'js-mode-hook 'my-paredit-nonlisp) ;use with the above function
;; (add-hook 'js-mode-hook 'esk-paredit-nonlisp) ;for emacs starter kit

;; coffeescript
;; (add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))
;; (add-hook 'coffee-mode-hook 'subword-mode)
;; (add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
;; (add-hook 'coffee-mode-hook
;;           (defun coffee-mode-newline-and-indent ()
;;             (define-key coffee-mode-map "\C-j" 'coffee-newline-and-indent)
;;             (setq coffee-cleanup-whitespace nil)))
;; (custom-set-variables
;;  '(coffee-tab-width 2))
