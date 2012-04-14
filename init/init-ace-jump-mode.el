(require 'ace-jump-mode)
(global-set-key (kbd "C-j") 'ace-jump-word-mode)
(define-key ruby-mode-map (kbd "C-j") 'ace-jump-word-mode)

(global-set-key (kbd "C-c j") 'ace-jump-char-mode)

(provide 'init-ace-jump-mode)