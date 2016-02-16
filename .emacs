;; reload by M-x load-file

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; delete a selection when typing over it
(delete-selection-mode 1)

;; melpa repository
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; look for .el files in .emacs.d
(add-to-list 'load-path "~/.emacs.d/files")

;; type "y" for "yes
(fset 'yes-or-no-p 'y-or-n-p)

;; 'Uniquify' multiple buffers with the same name
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

;; close all buffers
(defun close-all-buffers ()
  (interactive)
    (mapc 'kill-buffer (buffer-list)))

;; flycheck syntax checker
;; http://www.flycheck.org/manual/latest/Quickstart.html
(add-hook 'after-init-hook #'global-flycheck-mode)

;; magit
(global-set-key (kbd "C-c g") 'magit-status)

;; rgrep
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
(global-set-key (kbd "C-q") 'query-replace)

(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-directories "config")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories ".sass-cache")
     (add-to-list 'grep-find-ignored-directories "static/dist")
     (add-to-list 'grep-find-ignored-directories "ignored_files")
     (add-to-list 'grep-find-ignored-directories "server/templates/dist")))

;; python
(load "python-mode")

;; js
(setq js-indent-level 4)

;; html
(add-hook 'html-mode-hook
          (lambda ()
            (set (make-local-variable 'sgml-basic-offset) 4)))

;; markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
 (global-whitespace-mode t)

(setq whitespace-global-modes '(not go-mode))
(setq whitespace-global-modes '(not text-mode))

;; backups
(defvar backup-dir (expand-file-name "~/.emacs.d/backups/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosaves/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; font
(set-face-attribute 'default nil
                    :family "Menlo" :height 145 :weight 'normal)

;; IDO mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;remove menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; remove startup message
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)

;; visual line wrapping
(global-visual-line-mode t)

;; remap beginning/end buffer
(global-set-key (kbd "C-c a") 'beginning-of-buffer)
(global-set-key (kbd "C-c e") 'end-of-buffer)

;; remap interactive find/replace
(global-set-key (kbd "M-s") 'query-replace)

;;  spell check
(setq ispell-program-name "ispell")

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
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

;; sort words
(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
    Prefixed with negative \\[universal-argument], sorts in reverse.

    The variable `sort-fold-case' determines whether alphabetic case
    affects the sort order.

    See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))
