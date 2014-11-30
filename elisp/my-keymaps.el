;; to math RubyMine Mac OSX10.5+
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-x") 'kill-region)
(global-set-key (kbd "M-A") 'smex)

(global-set-key (kbd "M-f") 'isearch-forward)
(define-key isearch-mode-map "\M-f" 'isearch-repeat-forward)

(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-r") 'query-replace)
(global-set-key (kbd "M-w") 'ido-kill-buffer)
(global-set-key (kbd "M-e") 'ido-switch-buffer)
(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-d") "\C-a\C- \C-n\M-w\C-y") ; Duplicate line
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "M-b") 'find-tag)
(global-set-key (kbd "M-s") 'save-buffer)

(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])

(global-set-key [(meta up)] 'er/expand-region)
(global-set-key [(meta down)] 'er/contract-region)

(global-set-key (kbd "M-}") 'next-buffer)
(global-set-key (kbd "M-{") 'switch-to-prev-buffer)

(global-set-key (kbd "M-/") 'comment-dwim)


(global-set-key (kbd "C-c p") 'recompile)

;; iedit
(global-set-key (kbd "C-,") 'iedit-dwim)
(global-set-key (kbd "C-<") 'iedit-mode)

;; multiple-cursor-s
(global-set-key (kbd "C-M-G") 'mc/mark-next-like-this)
(global-set-key (kbd "C-'") 'mc/edit-lines)

(global-set-key (kbd "C-c l") 'goto-last-change)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-]") 'textmate-shift-right)
(global-set-key (kbd "M-[") 'textmate-shift-left)
(global-set-key (kbd "M-j") 'other-window)
(global-set-key (kbd "M-b") 'etagM-select-find-tag)

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

(global-set-key (kbd "M-O") 'command-t)

(add-hook 'ido-minibuffer-setup-hook
          (lambda ()
            (define-key ido-completion-map "\C-n" 'ido-next-match)
            (define-key ido-completion-map "\C-p" 'ido-prev-match)))

(add-hook 'dired-mode-hook (lambda ()
  (define-key dired-mode-map "U" 'dired-up-directory)
  (define-key dired-mode-map "/" 'dired-isearch-filenames)))

(provide 'my-keymaps)
