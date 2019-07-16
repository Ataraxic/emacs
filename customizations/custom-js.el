;; javascript / htmljs
(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))

;;Shell scripts running node.js
(add-to-list 'interpreter-mode-alist '("node" . rjsx-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(require 'yasnippet)
(yas-reload-all)
(add-hook 'rjsx-mode-hook #'yas-minor-mode)
