(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-]") 'textmate-shift-right)
(global-set-key (kbd "M-[") 'textmate-shift-left)
(global-set-key (kbd "M-j") 'other-window)
(global-set-key (kbd "M-.") 'etags-select-find-tag)
(global-set-key (kbd "M-k") 'cycle-buffer)
(global-set-key (kbd "M-K") 'cycle-buffer-backward)

;; binding some functions to other keys to prepare the navigation keys
(global-set-key (kbd "C-,") 'recenter-top-bottom)
(global-set-key (kbd "M-n") 'downcase-word)
(global-set-key (kbd "C-n") 'comment-dwim)

;; My personal navigation key-binding
(global-set-key (kbd "M-p") 'previous-line)
(global-set-key (kbd "M-l") 'backward-char)
(global-set-key (kbd "M-;") 'next-line)
(global-set-key (kbd "M-'") 'forward-char)

(global-set-key (kbd "C-p") 'backward-paragraph)
(global-set-key (kbd "C-l") 'backward-word)
(global-set-key (kbd "C-;") 'forward-paragraph)
(global-set-key (kbd "C-'") 'forward-word)

;; from effective emacs: http://sites.google.com/site/steveyegge2/effective-emacs
(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-c\C-m" 'smex)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-f" 'command-t)

(add-hook 'ido-minibuffer-setup-hook
          (lambda ()
            (define-key ido-completion-map "\C-n" 'ido-next-match)
            (define-key ido-completion-map "\C-p" 'ido-prev-match)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'newline-and-indent)
            (local-set-key [f1] 'yari)))

(add-hook 'change-major-mode-hook
          (lambda ()
            (global-set-key (kbd "C-n") 'comment-or-uncomment-region-or-line)))


(add-hook 'dired-mode-hook (lambda ()
  (define-key dired-mode-map "U" 'dired-up-directory)
  (define-key dired-mode-map "/" 'dired-isearch-filenames)))

(provide 'my-keymaps)
