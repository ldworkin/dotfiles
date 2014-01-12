; look for .el files in .emacs.d
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

; load auxiliaries
(load "funcs")
(load "matlab-emacs/matlab-load")
(load "python-mode")

; backups
(setq backup-directory-alist `(("." . "~/.saves")))

; marmalade
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

; yasnippet
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")
(setq yas-snippet-dirs "~/.emacs.d/elpa/yasnippet-0.8.0")
(require 'yasnippet)
(yas-global-mode 1)

; highlight 80 
(add-to-list 'load-path "~/.emacs.d/elpa/highlight-80+")
(require 'highlight-80+)

; font
(set-face-attribute 'default nil
                    :family "Menlo" :height 145 :weight 'normal)

; IDO mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; remove menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

; remove startup message
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)

; use pdflatex
(setq TeX-PDF-mode t)

; one space after period
(setq sentence-end-double-space nil)

; visual line wrapping
(global-visual-line-mode t)

; remap beginning/end buffer
(global-set-key (kbd "C-c a") 'beginning-of-buffer)
(global-set-key (kbd "C-c e") 'end-of-buffer)

; remap interactive find/replace
(global-set-key (kbd "M-s") 'query-replace)

; python
(setq comint-process-echoes t)
(setq comint-scroll-to-bottom-on-output t)

; smooth scrolling
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
(setq-default scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("View" "open %s.pdf" TeX-run-command t t)))

(setq ispell-program-name "aspell"
      ispell-dictionary "english"
      ispell-dictionary-alist
      (let ((default '("[A-Za-z]" "[^A-Za-z]" "[']" nil
                       ("-B" "-d" "english" "--dict-dir"
                        "/Library/Application Support/cocoAspell/aspell6-en-6.0-0")
                       nil iso-8859-1)))
        `((nil ,@default)
          ("english" ,@default))))
