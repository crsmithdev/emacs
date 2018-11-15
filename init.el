(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(setq initial-frame-alist '((top . 25) (left . 840) (width . 120) (height . 81)))
(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-12" ))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(set-face-attribute 'default t :font "Source Code Pro for Powerline-12" )
(set-face-attribute 'default nil :font "Source Code Pro for Powerline-12" )
(set-frame-font "Source Code Pro for Powerline-12" nil t)

;; 00-bootstrap.el
(require 'cl)
(require 'better-defaults)

;; 01-global.el
(setq user-full-name "Chris Smith")
(setq user-mail-address "crsmithdev@gmail.com")

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq ring-bell-function 'ignore)
(setq visible-bell t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(prefer-coding-system 'utf-8)
(column-number-mode 1)

(add-hook 'write-file-hooks
          '(lambda ()
             (delete-trailing-whitespace)))
(fset 'yes-or-no-p 'y-or-n-p)
(require 'all-the-icons)
;(setq ns-use-srgb-colorspace nil)

;; 20-evil.el
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)

;; 21-ivy.el
(ivy-mode 1)

;; 22-company.el
(add-hook 'after-init-hook 'global-company-mode)

;; 30-nlinum.el
(require 'nlinum-relative)
(nlinum-relative-setup-evil)
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)
(setq nlinum-relative-current-symbol "")
(global-nlinum-relative-mode)

;; 31-org.el
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(setq org-log-done t)
(setq org-startup-indented t)
(setq org-capture-templates '(("t" "Todo" entry
                               (file+headline "~/org/notes.org" "Tasks")
                               "* TODO %i%?\n%U")))

;; 32-modeline.el
(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                mode-line-mule-info
                mode-line-client
                mode-line-modified
                mode-line-remote
                mode-line-frame-identification
                mode-line-buffer-identification
                "   "
                mode-line-position
                evil-mode-line-tag
                (vc-mode vc-mode)
                "  "
                mode-line-modes
                mode-line-misc-info
                mode-line-end-spaces))


;; 40-bindings.el
(global-set-key "\C-x\C-m" 'execute-extended-command)

; 50-custom.el
(if (not (boundp 'crsmithdev/theme-loaded))
    (progn
      (require 'doom-themes)
      (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
            doom-themes-enable-italic t) ; if nil, italics is universally disabled
      (load-theme 'doom-vibrant t)
      (doom-themes-org-config)
      ;(load-theme 'zerodark t)
      ;(load-theme 'solarized t)
      ;(setq solarized-termcolors 256)
      ;(set-frame-parameter nil 'background-mode 'dark)
      ;(enable-theme 'solarized)
      ;(load-theme 'atom-one-dark t)
      (setq crsmithdev/theme-loaded t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (use-package zerodark-theme all-the-icons-dired telephone-line company doom-themes atom-one-dark-theme solarized-theme pallet nlinum-relative evil counsel color-theme-solarized better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
