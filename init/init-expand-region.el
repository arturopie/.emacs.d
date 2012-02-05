(require 'expand-region)

(add-hook 'js3-mode-hook 'er/add-js-mode-expansions)
(add-hook 'nxhtml-mode-hook 'er/add-html-mode-expansions)
(add-hook 'rhtml-mode-hook 'er/add-html-mode-expansions)

(provide 'init-expand-region)