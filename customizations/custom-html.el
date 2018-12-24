(add-to-list 'auto-mode-alist '("\\.html$'" . web-mode))
(add-hook 'web-mode-hook 'subword-mode)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)

(provide'custom-html)
