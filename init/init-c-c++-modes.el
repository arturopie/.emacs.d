(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)
    (local-set-key  (kbd "C-c c") 'compile)
    (local-set-key  (kbd "C-c r") 'recompile)))

(add-hook 'c++-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)
    (local-set-key  (kbd "C-c c") 'compile)
    (local-set-key  (kbd "C-c r") 'recompile)
    (subword-mode 1)))

(add-hook 'makefile-mode
  (lambda()
    (local-set-key  (kbd "C-c c") 'compile)))

(provide 'init-c-c++-modes)