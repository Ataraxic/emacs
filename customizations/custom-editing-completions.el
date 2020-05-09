(require 'go-mode)
(require 'company)                                   ; load company mode
(require 'company-go)                                ; load company mode go backend

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; (use-package company
;;   :ensure t
;;   :config
;;   ;; Optionally enable completion-as-you-type behavior.
;;   (setq company-idle-delay 0)
;;   (setq company-minimum-prefix-length 1))

;; company-lsp integrates company mode completion with lsp-mode.
;; completion-at-point also works out of the box but doesn't support snippets.
(use-package company-lsp
  :ensure t
  :commands company-lsp)


;; (add-hook 'go-mode-hook (lambda ()
;;                           (set (make-local-variable 'company-backends) '(company-go))
;;                           (company-mode)))

;; (setq company-tooltip-limit 20)                      ; bigger popup window
;; (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
;; (setq company-echo-delay 0)                          ; remove annoying blinking
;; (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
