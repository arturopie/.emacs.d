(setq load-path (cons "/usr/lib/erlang/lib/tools-2.6.7/emacs/" load-path))
(setq erlang-root-dir "/usr/lib/erlang/")
(setq exec-path (cons "/usr/lib/erlang/bin/" exec-path))
(require 'erlang-start)
(defvar inferior-erlang-prompt-timeout t)

(provide 'init-erlang)
