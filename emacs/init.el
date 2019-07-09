;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/custom")

;; Sets up exec-path-from-shell (Mac only) so that Emacs will use the
;; correct environment variables
(load "mac.el")

(load "clojure.el")

;; No backups:
(setq make-backup-files nil)

;; Turn on syntax highlighting for all major modes:
(global-font-lock-mode t)

;; Number lines:
(setq line-number-mode t)

;; Number columns:
(setq column-number-mode t)

;; Turn on pending delete (when a region
;; is selected, typing replaces it)
(delete-selection-mode t)

;; yes -> y, no -> n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Mac specific:
(setq mac-right-option-modifier 'none)

;; Path setup, for some reason .bash_profile is not picked up:
(setenv "PATH"
	(concat "/usr/local/bin:~/bin:"
		(getenv "PATH")))

(setq exec-path (append exec-path '("/usr/local/bin")))

;; (provide 'my-minimum-conf)

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; Visual feedback on selections
;; (setq-default transient-mark-mode t)

;; Color stuff for shell et al.
;; (ansi-color-for-comint-mode-on)

;; Get rid of the toolbar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Ask for confirmation before quitting Emacs
(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
          'append)

;; Undisable some useful functions
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Always end a file with a newline
(setq require-final-newline t)

;; No scroll bar
(set-scroll-bar-mode nil)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Stuff to deal with many buffers
;; Nicer way to show nonunique buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(iswitchb-mode t)
(global-set-key (kbd "C-x C-b") 'bs-show)

(require 'ido)
(setq ido-enable-flex-matching t)
(ido-everywhere t)
(ido-mode t)
(ido-ubiquitous-mode t)
(ido-everywhere t)

;; Enable wheelmouse support by default
(cond (window-system
       (mwheel-install)))

;; Setup Opera as the browser
;; (setq browse-url-browser-function 'browse-url-generic
;;      browse-url-generic-program "opera"
;;      browse-url-generic-args '("-newpage"))

;; Start a server for emacsclient
(setq server-socket-dir (expand-file-name"~/.emacs.d/server"))
(server-start)

;; Save/reload session
;(setq desktop-dirname (expand-file-name "~/.emacs.d/desktop"))
(desktop-save-mode 1)
(setq desktop-save t)
;(desktop-read (expand-file-name "~/.emacs.d/desktop"))

;; (setq x-select-enable-clipboard t)

;; (provide 'my-generic-conf)

;; Taken from: http://orgmode.org/manual/Activation.html#Activation
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.  org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Hooks for org
(add-hook 'org-mode-hook 'auto-fill-mode)

;; All files in ~/org are agenda-files:
;; (setq org-agenda-files (file-expand-wildcards "~/org/*.org"))

;; Return activates link:
(setq org-return-follows-link t)

(require 'ob-shell)

(setq org-confirm-babel-evaluate nil)

;; Packages
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


(require 'ledger-mode)

;; Other  contrib stuff
;; (require 'org-exp-bibtex)
; Deprecated (?) Mon Aug  1 16:03:15 EEST 2011
;; (require 'org-protocol)

;; Set to the location of your Org files on your local system
;; (setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
;; (setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
;; (setq org-mobile-directory "~/Dropbox/MobileOrg")

; For refiling:
;; (setq org-refile-targets (quote (("~/org/personal.org" :maxlevel . 1))))

;; (setq reftex-default-bibliography '("/home/kas/Dropbox/library.bib"))

;; (require 'ob-python)

;; (provide 'my-org-conf)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
