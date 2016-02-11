; reload by M-x load-file

(setq-default indent-tabs-mode nil)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

; look for .el files in .emacs.d
(add-to-list 'load-path "~/.emacs.d/files")

; 'uniquify' multiple buffers with the same name
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

; close all buffers
(defun close-all-buffers ()
  (interactive)
    (mapc 'kill-buffer (buffer-list)))


(add-hook 'after-init-hook #'global-flycheck-mode)

; neotree
(add-to-list 'load-path "~/.emacs.d/elpa/neotree-20151101.607")
(require 'neotree)
(global-set-key (kbd "C-c n") 'neotree-toggle)

;magit
(global-set-key (kbd "C-c g") 'magit-status)

; rgrep
(eval-after-load "grep"
  '(grep-compute-defaults))

(defun sgrep (&optional confirm)
  (interactive "P")
  (rgrep (grep-read-regexp)
         "*"
         "~/my-socratic/atom/"
         confirm))

(defun mgrep (&optional confirm)
  (interactive "P")
  (rgrep (grep-read-regexp)
         "*"
         "/socratic/golang/src/github.com/socraticorg/apiv2"
         confirm))

(global-set-key (kbd "C-x f") 'find-file-in-repository)

(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-directories "config")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories ".sass-cache")
     (add-to-list 'grep-find-ignored-directories "static/dist")
     (add-to-list 'grep-find-ignored-directories "ignored_files")
     (add-to-list 'grep-find-ignored-directories "server/templates/dist")))

; python
(load "python-mode")

; coffee
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(flycheck-jshint-extract-javascript (quote auto)))

; js
(setq js-indent-level 4)

; html
(add-hook 'html-mode-hook
	  (lambda ()
	    ;; Default indentation is usually 2 spaces, changing to 4.
	    (set (make-local-variable 'sgml-basic-offset) 4)))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
      '(("django"    . "\\.html\\'")))

; markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
 (global-whitespace-mode t)

(setq whitespace-global-modes '(not go-mode))
; (setq whitespace-global-modes '(not text-mode))

; pbcopy
(require 'pbcopy)
(turn-on-pbcopy)

; matlab
(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
(load-library "matlab-load")

; backups
(defvar backup-dir (expand-file-name "~/.emacs.d/backups/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosaves/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

; yasnippet
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")
(setq yas-snippet-dirs "~/.emacs.d/elpa/yasnippet-0.8.0")
(require 'yasnippet)
(yas-global-mode 1)

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

; more python
(setq comint-process-echoes t)
(setq comint-scroll-to-bottom-on-output t)

; smooth scrolling
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
(setq-default scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

; open LaTex in preview
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("View" "open %s.pdf" TeX-run-command t t)))

; set default master files
(setq-default TeX-master nil)

; spell check
;(setq-default ispell-program-name "aspell")
(setq ispell-program-name "ispell")

; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

; sort words
(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
    Prefixed with negative \\[universal-argument], sorts in reverse.

    The variable `sort-fold-case' determines whether alphabetic case
    affects the sort order.

    See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))
(put 'downcase-region 'disabled nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
