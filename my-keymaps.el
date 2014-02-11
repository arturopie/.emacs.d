(global-set-key (kbd "C-c p") 'recompile)

(global-set-key (kbd "C-c s") 'magit-status)

(global-set-key (kbd "C-.") 'er/expand-region)
(global-set-key (kbd "C-M-.") 'er/contract-region)

(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)

;; iedit
(global-set-key (kbd "C-,") 'iedit-dwim)
(global-set-key (kbd "C-<") 'iedit-mode)

;; multiple-cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-'") 'mc/edit-lines)

(global-set-key (kbd "C-c l") 'goto-last-change)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-]") 'textmate-shift-right)
(global-set-key (kbd "M-[") 'textmate-shift-left)
(global-set-key (kbd "M-j") 'other-window)
(global-set-key (kbd "s-b") 'etags-select-find-tag)

(global-set-key (kbd "C-;") 'comment-dwim)

;; from http://emacsrocks.com/e12.html
(global-set-key (kbd "C-c DEL") 'sgml-delete-tag)
(global-set-key (kbd "C-c C-e") 'sgml-close-tag)
(global-set-key (kbd "C-c C-l") 'zencoding-expand-line)

;; from effective emacs: http://sites.google.com/site/steveyegge2/effective-emacs
(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-x\ m" 'smex)
(global-set-key "\C-c\C-m" 'smex)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-c\ o" 'command-t)

(add-hook 'ido-minibuffer-setup-hook
          (lambda ()
            (define-key ido-completion-map "\C-n" 'ido-next-match)
            (define-key ido-completion-map "\C-p" 'ido-prev-match)))

(add-hook 'dired-mode-hook (lambda ()
  (define-key dired-mode-map "U" 'dired-up-directory)
  (define-key dired-mode-map "/" 'dired-isearch-filenames)))

(provide 'my-keymaps)
