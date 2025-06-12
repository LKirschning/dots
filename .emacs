;; prerequisite for packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; packages

(use-package org-roam
  :ensure t)

;; this kind of autocomplete thing in interactive situations (like opening a file or switching buffer)
(use-package ido)
(ido-mode 1)
(ido-everywhere 1)

;; basic conf for looks
(tool-bar-mode -1)                     ;; Toolbar ausblenden
(menu-bar-mode -1)                     ;; Menüleiste ausblenden
(scroll-bar-mode -1)                   ;; Scrollbar ausblenden
(global-display-line-numbers-mode 1)   ;; Zeilennummern anzeigen
(global-hl-line-mode 1)                ;; Aktuelle Zeile hervorheben
(set-face-attribute 'default nil :height 150) ;; Größe in 1/10 pt (z. B. 140 = 14

(setq inhibit-startup-message t)       ;; Startbildschirm deaktivieren
(setq display-line-numbers-type 'relative) ;; Relative Zeilennummern (optional)

(setq-default indent-tabs-mode nil)     ;; Leerzeichen statt Tabs
(setq-default tab-width 4)              ;; Tabweite auf 4 setzen


(electric-pair-mode 1)    ;; Automatisches Schließen von Klammern
(show-paren-mode 1)       ;; Hervorhebung passender Klammern
(setq-default c-basic-offset 4) ;; Standard-Einrückung für C

(recentf-mode 1)          ;; Zuletzt geöffnete Dateien merken
(save-place-mode 1)       ;; Cursor-Position in Dateien speichern
(global-auto-revert-mode 1) ;; Automatisches Neuladen geänderter Dateien
;; ignore upper lower case in search 
(setq-default case-fold-search nil)

;; Haskell
(add-hook 'haskell-mode-hook #'hindent-mode)
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))

;; set org roam directory to sync folder
(setq org-roam-directory "~/Sync/org-roam")
(setq org-roam-db-location (expand-file-name (locate-user-emacs-file "org-roam.db")))

(org-roam-db-autosync-mode)

;;this is for org-roam
(global-set-key (kbd "C-c i") 'org-roam-node-insert) ;; i is for insert node
(global-set-key (kbd "C-c n") 'org-roam-node-find) ;; n is for new node (or find) 


;; This is for org mode
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)




;; set directory to sync folder
;(setq org-directory  '("~/Sync/org"))
;(setq org-agenda-files  '("~/Sync/org"))
;(setq org-default-notes-file '("~/Sync/org/notes.org"))

(setq org-directory "~/Sync/org")
(setq org-agenda-files '("~/Sync/org"))
(setq org-default-notes-file "~/Sync/org/notes.org")



;;(setq org-default-notes-file "~/Sync/org/notes.org")

 
;; this is extension of TODO keywords
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;; this is customization of tags
(setq org-tag-alist '(("@work" . ?w)
                      ("@home" . ?h)
                      ("@university" . ?u)
                      ("@friends" . ?f)
                      ))

;; more org for Calendar export
(defun set-org-agenda-files ()
  "Set different org-files to be used in `org-agenda`."
  (setq org-agenda-files (list (concat org-directory )))
  )


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-enabled-themes '(deeper-blue))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(sqlite3 anki-editor anki-connect racket-mode auctex yaml-mode
             haskell-mode org-roam)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; this is yaml mode
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))





;; Set the default command for LaTeX


(setq TeX-command-default "pdflatex")

;; Enable AUCTeX features
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq LaTeX-indent-level 2)

;; do not show lines in Docview mode
(add-hook 'doc-view-mode-hook (lambda () (display-line-numbers-mode 0)))

;; make latex mode automatically in tex files
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-default-mode 'LaTeX)))



;;(add-hook 'tex-mode-hook )   ; For plain TeX files
;;(add-hook 'LaTeX-mode-hook) ; For LaTeX files



