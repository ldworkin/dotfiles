; reload by M-x load-file

; look for .el files in .emacs.d
(add-to-list 'load-path "~/.emacs.d/files")

; 'uniquify' multiple buffers with the same name
(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

; python
(load "python-mode")

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
