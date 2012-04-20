(require 'ruby-tools)

(add-hook 'ruby-mode-hook 'ruby-tools-mode)
(add-hook 'rhtml-mode 'ruby-tools-mode)

(provide 'init-ruby-tools)