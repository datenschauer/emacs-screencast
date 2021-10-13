;;---------------------------------
;; my growing config
;;---------------------------------

;; get rid of all fancy ui stuff
(setq inhibit-startup-message t)
(setq-default visible-bell t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)

(setq default-directory "/home/stefan")

(setq make-backup-files nil) ;; stop creating those backup~ files
(setq auto-save-default nil) ;; stop creating those #autosave# files

;; delete marked text
(delete-selection-mode 1)

;; only ask y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; show parens
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)

;; automatic set parens
(electric-pair-mode 1)

;; use visual line mode as often as possible
(visual-line-mode t)
(global-visual-line-mode t)

;; package management
(require 'package)
(add-to-list 'package-archives
             '("Melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives	     
             '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives	     
             '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(add-to-list 'package-archives	     
             '("gnu" . "https://elpa.gnu.org/packages/") t)
(unless package-archive-contents    ;; Refresh the packages descriptions
  (package-refresh-contents))
(setq package-load-list '(all))     ;; List of packages to load
(package-initialize)      

;; install use-package if it's not already there
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Theming
(use-package modus-themes
  :ensure t)
(load-theme 'modus-vivendi)

;; pretty modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; use only Unix like UTF-8 encoding!
(setq-default buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)

