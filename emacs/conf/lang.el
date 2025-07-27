(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
	 ("\\.jsp\\'" . web-mode)
	 ("\\.gsp\\'" . web-mode)
	 ("\\ts[x]?\\'" . web-mode)
	 ("\\js[x]?\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t))

(use-package rust-mode
  :mode (("\\.rs\\'" . rust-mode)))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package python-mode
  :mode "\\.py\\'")

(use-package typst-ts-mode
  :mode "\\.typ\\'")

(use-package elm-mode
  :mode "\\.elm\\'")

(use-package vue-mode
  :mode "\\.vue\\'")
