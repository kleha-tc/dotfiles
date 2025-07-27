;; -*- lexical-binding: t; -*-
;; ddskk
(require 'ddskk)
(setq skk-large-jisyo "~/skk/SKK-JISYO.L")
(defun my/enable-skk ()
  (skk-latin-mode 1))
(add-hook 'find-file-hook 'my/enable-skk)
(setq skk-rom-kana-rule-list
      (append '(("." nil "．") ("," nil "，"))
              skk-rom-kana-rule-list))

;; magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; direnv
(use-package direnv
  :ensure t
  :config
  (direnv-mode))

;; copilot.el
(use-package copilot
  :hook
  (prog-mode . copilot-mode)
  :init
  (setq copilot-indent-offset-warning-disable t)
  :config
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion))

;; copilot-chat
(use-package copilot-chat
:bind (:map global-map
          ("C-c C-y" . copilot-chat-yank) 
          ("C-c M-y" . copilot-chat-yank-pop)
          ("C-c C-M-y" . (lambda () (interactive) (copilot-chat-yank-pop -1)))))
