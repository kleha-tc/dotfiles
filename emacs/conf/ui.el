;; -*- lexical-binding: t; -*-
;; powerline
(use-package powerline
    :ensure t
    :config
    (powerline-default-theme))

;; Catppuccin
(use-package catppuccin
    :ensure t
    :config
    (load-theme 'catppuccin :no-confirm)
    (setq catppuccin-flavor 'frappe)
    (catppuccin-reload)
)


; (load-theme 'dracula :no-confirm)

; (load-theme 'solarized-dark t)

;; Font
(set-language-environment "Japanese")
(add-to-list 'default-frame-alist '(font . "HackGen Console NF" ))

;; Trun to Unvisible several menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)
