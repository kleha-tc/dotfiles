(use-package ivy
    :ensure t
    :init
    (ivy-mode 1))

(use-package counsel
    :ensure t
    :bind (("C-c f" . counsel-fzf)
            ("M-x" . counsel-M-x)
            ("M-y" . counsel-yank-pop))
    :init
    (counsel-mode 1)
)

(use-package swiper
    :ensure t
    :bind (("M-s M-s" . swiper-thing-at-point)))
