;;---------------------------------
;; my growing config
;;---------------------------------

;; get rid of all fancy ui stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-scroll-bar-mode 'nil)
(setq inhibit-startup-message t)
(setq-default visible-bell t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)

;; THEMING
(set-face-attribute 'default nil :font "Inconsolata-12") 
(use-package modus-themes
  :ensure t)
(load-theme 'modus-vivendi t)

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

;; ORG MODE
(setq org-use-fast-todo-selection t)

(setq org-agenda-files '("~/Nextcloud/Dokumente/Uni/Uni Allgemein/Wissenschaftliches_Arbeiten_mit_Emacs/org_test.org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-todo-keywords
 '((sequence "NEXT(n)" "TODO(t)" "STARTED(s)" "TERMIN(a)" "PROJ(p)" "WAITING(w@/!)" 
              "SOMEDAY(i!)" "|" "DONE(d!)" "CANCELED(c@/!)" "DELEGATED(g@/!)")))

(setq org-tag-alist '(("uni" . ?w) ("@home" .?h) ("unterwegs" .?u) ("dringend" . ?d)))

(setq org-drawers (quote ("PROPERTIES" "CLOCKTABLE" "LOGBOOK" "CLOCK")))

(setq org-hide-leading-stars 'hidestars)
(setq org-blank-before-new-entry
      '((heading . always)
       (plain-list-item . nil)))
(setq org-cycle-separator-lines 1)
(setq org-ellipsis " >")
(setq org-hide-emphasis-markers t)
(setq org-startup-folded t)
(setq org-src-fontify-natively t)
(setq org-indent-mode nil)

(setq org-catch-invisible-edits t)
(setq org-ctrl-k-protect-subtree t) 
(setq org-return-follows-link t)
(setq org-use-fast-todo-selection t)
(setq org-M-RET-may-split-line nil)))

(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1 )))
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-span (quote day)) ;; show only current day as default
(setq org-agenda-window-setup (quote other-window));;öffne agenda in anderem Fenster
(setq org-agenda-tags-column -100) ; take advantage of the screen width
(setq org-agenda-show-future-repeats nil) ;; don't show repetetive tasks only today or nearest future
(setq org-deadline-warning-days 7)
(setq org-agenda-tags-column -100) ; take advantage of the screen width

(setq calendar-week-start-day 1
          calendar-day-name-array ["Sonntag" "Montag" "Dienstag" "Mittwoch"
                                   "Donnerstag" "Freitag" "Samstag"]
          calendar-month-name-array ["Januar" "Februar" "März" "April" "Mai"
                                     "Juni" "Juli" "August" "September"
                                     "Oktober" "November" "Dezember"])

(setq solar-n-hemi-seasons
      '("Frühlingsanfang" "Sommeranfang" "Herbstanfang" "Winteranfang"))

(setq holiday-general-holidays
      '((holiday-fixed 1 1 "Neujahr")
        (holiday-fixed 5 1 "1. Mai")
        (holiday-fixed 10 3 "Tag der Deutschen Einheit")))

;; Feiertage für Bayern, weitere auskommentiert
(setq holiday-christian-holidays
      '((holiday-float 12 0 -4 "1. Advent" 24)
        (holiday-float 12 0 -3 "2. Advent" 24)
        (holiday-float 12 0 -2 "3. Advent" 24)
        (holiday-float 12 0 -1 "4. Advent" 24)
        (holiday-fixed 12 25 "1. Weihnachtstag")
        (holiday-fixed 12 26 "2. Weihnachtstag")
        (holiday-fixed 1 6 "Heilige Drei Könige")
        (holiday-easter-etc -48 "Rosenmontag")
        ;; (holiday-easter-etc -3 "Gründonnerstag")
        (holiday-easter-etc  -2 "Karfreitag")
        (holiday-easter-etc   0 "Ostersonntag")
        (holiday-easter-etc  +1 "Ostermontag")
        (holiday-easter-etc +39 "Christi Himmelfahrt")
        (holiday-easter-etc +49 "Pfingstsonntag")
        (holiday-easter-etc +50 "Pfingstmontag")
        (holiday-easter-etc +60 "Fronleichnam")
        (holiday-fixed 8 15 "Mariae Himmelfahrt")
        (holiday-fixed 11 1 "Allerheiligen")
        ;; (holiday-float 11 3 1 "Buss- und Bettag" 16)
        (holiday-float 11 0 1 "Totensonntag" 20)))


;; shortcut for changing font-size
(define-key global-map (kbd "C-1") 'text-scale-increase)
(define-key global-map (kbd "C-0") 'text-scale-decrease)
