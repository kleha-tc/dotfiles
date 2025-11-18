;; -*- lexical-binding: t; -*-
(require 'org)
(define-key org-mode-map (kbd "C-c s") 'org-insert-structure-template)

(org-babel-do-load-languages
  'org-babel-load-languages
  '(
    (rust .t)
    ))

(setq org-preview-latex-default-process 'dvipng)
