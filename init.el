;; -*- coding: utf-8 -*-
(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

(require 'init-pre-package-variables)
(require 'init-packages)
(require 'init-autopair)
(require 'init-web-mode)
(require 'init-crontab)
(require 'init-css)
(require 'init-csv)
(require 'init-dired)
(require 'init-flymake)
(require 'init-haml)
(require 'init-ido)
(require 'init-expand-region)
(require 'init-maxframe)
(require 'init-org)
(require 'init-rinari)
(require 'init-linum)
(require 'init-rainbow-delims)
(require 'init-ack)
(require 'init-textmate)
(require 'init-rspec)
;; (require 'init-autocomplete) ;; Too slow for my C++ projects
(require 'init-anything)
(require 'init-ruby)
(require 'init-sass)
(require 'init-markdown)
(require 'init-moustache)
(require 'init-yaml)
(require 'init-ruby-block)
(require 'init-ruby-end)
(require 'init-escreen)
(require 'init-eproject)
(require 'init-js)
(require 'init-lua)
(require 'init-git-blame)
(require 'init-ace-jump-mode)
(require 'init-highlight-symbol)
(require 'init-prolog)
(require 'init-shell-script-mode)
;; (require 'init-ruby-tools)
(require 'dumb-refactorings)
(require 'init-c-c++-modes)
(require 'init-java-mode)
(require 'init-magit)
(require 'guru-mode)

(require 'my-defuns)
(require 'init-ansi-color)
(require 'my-keymaps)
(require 'my-emacs-settings)
(require 'my-shell-settings)

(require 'hexcolors)
(require 'mingle)

(require 'server)
(unless (server-running-p)
  (server-start))

(setq custom-file "~/.emacs.d/my-custom-variables.el")
(load custom-file)

(maybe-maximize-frame)
