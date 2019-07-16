;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-x o") 'ace-window)

(global-set-key (kbd "C-/") 'undo)

(global-set-key (kbd "C-;") 'toggle-comment-on-line)

(with-eval-after-load 'helm
  ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
  ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
  ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) 
  ;; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) 
  ;; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) 
  ;; list actions using C-z
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-h r") 'helm-info-emacs)
  (global-set-key (kbd "C-h C-l") 'helm-locate-library)
  )

(provide 'custom-keybinds)
