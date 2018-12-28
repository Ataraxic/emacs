;; After Bankruptcy
;; Slimmed down version of prelude

;; Always load newest byte code
(setq load-prefer-newer t)

;; so much utility
(require 'cl)

;; Taken from prelude's init.el
(defun add-subfolders-to-load-path (parent-dir)
 "Add all level PARENT-DIR subdirs to the `load-path'."
 (dolist (f (directory-files parent-dir))
   (let ((name (expand-file-name f parent-dir)))
     (when (and (file-directory-p name)
                (not (string-prefix-p "." f)))
       (add-to-list 'load-path name)
       (add-subfolders-to-load-path name)))))

(defvar custom-default-directory (file-name-directory "~/.emacs.d/")
  "Default Directory")
(defvar customization-directory (expand-file-name "customizations" custom-default-directory)
  "Customization Directory editing/language-specific/etc")
(defvar snippets-directory (expand-file-name "snippets" custom-default-directory)
  "directory for snippets")
(defvar vendor-directory (expand-file-name "vendor" custom-default-directory)
  "Vendor code not available on package repositories")
(defvar savefile-directory (expand-file-name "savefile" custom-default-directory)
  "Various savefiles history, place tracking")
(defvar user-packages-directory (expand-file-name "elpa" custom-default-directory)
  "User Downloaded Packages")
(defvar themes-directory (expand-file-name "themes" custom-default-directory)
  "put your themes here")

(add-subfolders-to-load-path vendor-directory)

(unless (file-exists-p savefile-directory)
  (make-directory savefile-directory))

(add-to-list 'load-path customization-directory)
(add-to-list 'load-path snippets-directory)
(add-to-list 'load-path vendor-directory)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; autoload all my customizations (core load first by alphabet)
(mapc #'load (directory-files customization-directory t ".el$"))

(set-face-attribute 'default nil
                    :family "Inconsolata" :height (case system-type
                                                    ('gnu/linux 130)
                                                    ('darwin 130)) :weight 'normal)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(scss-mode parinfer parinfer-mode org-plus-contrib org-mode multi-term zenburn-theme yasnippet yaml-mode web-mode smartparens rubocop rspec-mode rjsx-mode rbenv rainbow-delimiters markdown-mode magit json-mode helm-projectile helm-ag expand-region exec-path-from-shell enh-ruby-mode editorconfig crux cider anzu ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
