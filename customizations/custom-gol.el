(require 'go-mode)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(add-hook 'go-mode-local-vars-hook #'lsp!)

;; length 4
(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode 1)
            (setq tab-width 4)))

(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))
