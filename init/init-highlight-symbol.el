(require 'highlight-symbol)

(add-hook 'ruby-mode-hook 'highlight-symbol-mode)
(add-hook 'js3-mode-hook 'highlight-symbol-mode)
(add-hook 'nxml-mode-hook 'highlight-symbol-mode)

(provide 'init-highlight-symbol)