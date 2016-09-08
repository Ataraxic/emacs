(require 'rbenv)
(global-rbenv-mode)

(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

;; (add-hook 'enh-ruby-mode-hook 'robe-mode)

(require 'rubocop)
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)

(require 'rspec-mode)
(add-hook 'enh-ruby-mode-hook 'rspec-mode)
;; I want rspec instead of rake spec
(setq rspec-use-rake-when-possible nil)
;; Scroll to the first test failure
(setq compilation-scroll-output 'first-error)

;; Prevent emacs from adding the encoding line at the top of the file
(setq ruby-insert-encoding-magic-comment nil)
;;
;; (eval-after-load 'company
  ;; '(push 'company-robe company-backends))

;; for use with rspec-mode and binding.pry
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
