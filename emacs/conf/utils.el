;; -*- lexical-binding: t; -*-
;; ddskk
(use-package ddskk
  :ensure t
  :config
  (setq skk-large-jisyo "~/skk/SKK-JISYO.L")
  (defun my/enable-skk ()
    (skk-latin-mode 1))
  (add-hook 'find-file-hook 'my/enable-skk)
  (setq skk-rom-kana-rule-list
      (append '(("." nil ". ") ("," nil ", "))
              skk-rom-kana-rule-list)))


;; magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;; neotree
(use-package neotree
  :ensure t
  :bind (([f8] . neotree-toggle)))


;; which-key
(use-package which-key
  :ensure t
    :config
    (which-key-mode))

;; yasnippet
(use-package yasnippet
  :ensure t
	:config
	(yas-global-mode 1))

;; pdf-tools
(use-package pdf-tools
  :config
  (pdf-tools-install)
  (add-hook 'pdf-view-mode-hook #'pdf-view-roll-minor-mode)
  (add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))
  (add-hook 'pdf-view-mode-hook #'auto-revert-mode)
)

;; exec-path-from-shell
(use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize))

;; direnv-mode
(use-package direnv
  :config
  (direnv-mode))
