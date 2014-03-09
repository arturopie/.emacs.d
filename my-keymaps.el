;; to math RubyMine Mac OSX10.5+
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-x") 'kill-region)

(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-f") 'isearch-forward)
(global-set-key (kbd "s-r") 'query-replace)
(global-set-key (kbd "s-w") 'ido-kill-buffer)
(global-set-key (kbd "s-e") 'ido-switch-buffer)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-d") "\C-a\C- \C-n\M-w\C-y") ; Duplicate line
(global-set-key (kbd "s-l") 'goto-line)
(global-set-key (kbd "s-b") 'find-tag)

(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(global-set-key [(meta up)] 'er/expand-region)
(global-set-key [(meta down)] 'er/contract-region)

(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-{") 'switch-to-prev-buffer)

(global-set-key (kbd "s-/") 'comment-dwim)


(global-set-key (kbd "C-c p") 'recompile)

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
