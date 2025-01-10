;; color theme
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-fravor 'frappe)
(catppuccin-reload)

;; setup skk
(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)

