(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
;; to copy to system clipboard
(setq x-select-enable-clipboard t)
(setq inhibit-startup-message t)
(setq fill-column 85)
(setq initial-major-mode 'emacs-lisp-mode)
(setq browse-url-generic-program "google-chrome")
(setq initial-scratch-message nil)

(require 'smex)
(smex-initialize)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

(if (featurep 'ns)
    (set-frame-font "Inconsolata"))

(require 'color-theme-railscasts)
(color-theme-railscasts)

(setq shell-command-switch "-ic")

(add-hook 'after-change-major-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)))

(set-face-foreground 'vertical-border "#fcf6e3")
(set-face-background 'vertical-border "#fcf6e3")

(push "/usr/local/bin" exec-path)
(push (expand-file-name "~/scripts") exec-path)

(paren-activate) ; mic-paren
(setq default-indicate-empty-lines t)
(recentf-mode 1)
(setq recentf-max-saved-items 50
      recentf-exclude '("/tmp/" "/ssh:"))

(provide 'my-emacs-settings)

