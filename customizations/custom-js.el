;; javascript / htmljs
(add-to-list 'auto-mode-alist '("\\.js$" . jtsx-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . jtsx-jsx-mode))

;;Shell scripts running node.js
(add-to-list 'interpreter-mode-alist '("node" . rjsx-mode))

(use-package jtsx
  :ensure t
  :mode (("\\.jsx?\\'" . jtsx-jsx-mode)
         ("\\.tsx\\'" . jtsx-tsx-mode)
         ("\\.ts\\'" . jtsx-typescript-mode))
  :commands jtsx-install-treesit-language
  :hook ((jtsx-jsx-mode . hs-minor-mode)
         (jtsx-tsx-mode . hs-minor-mode)
         (jtsx-typescript-mode . hs-minor-mode))
  :custom
  (js-indent-level 2)
  ;; Optional customizations
)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(require 'yasnippet)
(yas-reload-all)
(add-hook 'rjsx-mode-hook #'yas-minor-mode)
