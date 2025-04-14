;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs initialization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remove startup message
;;(setq inhibit-startup-message t)

;; You will most likely need to adjust this font size for your system!
(defvar runemacs/default-font-size 180)

;; Remove UI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

;; Setup visible bell
(setq visible-bell t)

;;
;; Emacs customization will write to this file
;;
(setopt custom-file "~/.config/emacs/custom.el")


;;
;; Initialize package sources
;;
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-packge))

(require 'use-package)
(setq use-package-always-ensure t)

;; diminish hides the minor mode
(use-package diminish)
(require 'diminish)
(diminish 'ivy-mode)
(diminish 'ElDoc)
(diminish 'counsel)

;; Ivy completion engine
(use-package ivy
  :ensure t
  :diminish
  :bind (
	 ("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config (ivy-mode 1)
  )
(require 'ivy
	 (ivy-mode))

(setq ivy-use-virtual-buffers t)

(use-package swiper
  :ensure t
  )
(use-package counsel
  :ensure t
  )
(require 'counsel
	 (counsel-mode))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package nerd-icons
  ;; :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))
(setq doom-modeline-time-icon t)
(setq doom-modeline-time-live-icon t)
(setq doom-modeline-time-analogue-clock t)
(setq doom-modeline-time-clock-size 0.7)
(setq doom-modeline-minor-modes nil)
(setq display-time-format "%H:%M")
(display-battery-mode t)
(display-time)

;; relative line numbering
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; evil mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :ensure t
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(cond
 ((string-equal system-type "gnu/linux")
    ;; Font Configuration ----------------------------------------------------------
    ;; Set default font
    (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 125)
    ;; Set the fixed pitch face
    (set-face-attribute 'fixed-pitch nil :font "JetBrainsMono Nerd Font" :height 125)
    ;; Set the variable pitch face
    (set-face-attribute 'variable-pitch nil :font "Cantarell" :height 125 :weight 'regular)
    ;; Set leader key
    (evil-set-leader nil  (kbd "\\"))
 )
 ((string-equal system-type "darwin")
    ;; Font Configuration ----------------------------------------------------------
    ;; Set default font
    (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 175)
    ;; Set the fixed pitch face
    (set-face-attribute 'fixed-pitch nil :font "JetBrainsMono Nerd Font" :height 175)
    ;; Set the variable pitch face
    (set-face-attribute 'variable-pitch nil :font "Cantarell" :height 175 :weight 'regular)
    ;; Set leader key
    (evil-set-leader nil  (kbd "`"))
 )
)
  
;; Buffer list
(evil-define-key 'normal 'global (kbd "<leader>b") 'ivy-switch-buffer)
;; Recent files
(evil-define-key 'normal 'global (kbd "<leader>h") 'counsel-recentf)
;; File explorer
(evil-define-key 'normal 'global (kbd "<leader>f") 'dired-sidebar-toggle-sidebar)
;; Magit
(evil-define-key 'normal 'global (kbd "<leader>G") 'magit-status)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package key-chord)
;; Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)


(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'nerd-icons)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))
;;
;; Use dired-omit-mode to hide hidden files
;;
;; toggle with C-x M-o
;;
(setq dired-omit-mode t)
(use-package dired
  :ensure nil
  :bind
  (:map dired-mode-map ("." . dired-omit-mode))
  :custom
  (dired-omit-files (rx (seq bol ".")))
  :hook
  (dired-mode . dired-omit-mode)
  :init
  (with-eval-after-load 'dired (require 'dired-x)))

(use-package nerd-icons :defer t)
(use-package nerd-icons-dired
  :commands (nerd-icons-dired-mode))
;; All the icons
(use-package all-the-icons
  :if (display-graphic-p))
;;(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;;
;; Magit
;;
(use-package magit
  :ensure t)
;;;;;;;;;;;;;;;;;;;
;; clojure
;;;;;;;;;;;;;;;;;;;
;;
;; clojure-mode
;;
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))
;;
;; CIDER
;;
(use-package cider
  :ensure t
  :pin melpa-stable)
(setq tab-always-indent 'complete)

;;
;; org mode
;;
(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))
;;
;;
;;
(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Ubuntu Sans" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))
;;
;;
;;
(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
	org-hide-emphasis-markers t)
  (efs/org-font-setup))
;;
;;
;;
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
;;
;;
;;
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 200
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))
;;
;; markdown mode
;;
(use-package markdown-mode
  :ensure t
  :init (setq markdown-command "markdown")
  :bind (:map markdown-mode-map
	      ("C-c C-e" . markdown-do)))
(setq markdown-split-window-direction 'right)

;;
;; geiser
;;
(use-package geiser-guile)
