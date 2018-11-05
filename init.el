(require 'cask "cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

; 00-bootstrap.el
(require 'cl)
(require 'better-defaults)

; 01-global.el
(setq user-full-name "Aaron Bedra")
(setq user-mail-address "aaron@aaronbedra.com")

(setq inhibit-splash-screen t
      initial-scratch-message nil)

; 20-evil.el
(require 'evil)
(evil-mode 1)

; 30-nlinum.el
(require 'nlinum-relative)
(nlinum-relative-setup-evil)                    
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)
(setq nlinum-relative-current-symbol "")    

;; 31-org.el
;(setq org-agenda-files '("~/notes/inbox.org"
;                         "~/notes/gtd.org"
;                         "~/notes/tickler.org"))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(setq org-log-done t)
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/org/notes.org" "Tasks")
                               "* TODO %i%?")))
(with-eval-after-load 'org (setq org-default-notes-file (expand-file-name "notes.org" org-directory)))

;; 40-bindings.el
(global-set-key "\C-x\C-m" 'execute-extended-command)

; 50-custom.el
;(load-theme 'solarized-dark t)
(if (not (boundp 'crsmithdev/theme-loaded))
    (progn
        (load-theme 'solarized t)
        (set-frame-parameter nil 'background-mode 'dark)
        (set-terminal-parameter nil 'background-mode 'dark)
        (setq solarized-termcolors 256)
        (setq crsmithdev/theme-loaded t)))
;(custom-set-faces (if (not window-system) '(default ((t (:background "nil"))))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
