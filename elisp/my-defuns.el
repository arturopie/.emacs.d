(require 'iedit)

(defun iedit-dwim (arg)
  "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
  (interactive "P")
  (if arg (iedit-mode)
    (save-excursion
      (save-restriction
        (widen)

        (if (eq major-mode 'ruby-mode) (narrow-to-ruby-block)
          (narrow-to-defun))
        (if iedit-mode (iedit-done)
          (iedit-start (current-word)))))))

(defun narrow-to-ruby-block ()
  (save-excursion
    (let ((start (progn (ruby-beginning-of-block) (point)))
          (end (progn (ruby-end-of-block) (point))))
      (narrow-to-region start end))))

(defun send-current-line-to-next-window ()
  "Send current line to next window"
  (interactive)
  (let ((current-line (buffer-substring-no-properties (point-at-bol) (point-at-eol)))
        (target (window-buffer (next-window))))
    (with-current-buffer target
      (insert current-line))))

(defun new-line-in-normal-mode ()
  "make a new line without moving the cursor or leaving normal mode"
  (interactive)
  (evil-set-marker ?z)
  (evil-insert-newline-below)
  (evil-force-normal-state)
  (evil-goto-mark ?z))

(defvar rails/models-alist nil)
(defun rails-model-files ()
  (all-files-under-dir-recursively (concat (eproject-root) "app/models") ".rb$"))

(defun rails-models-alist ()
  (or rails/models-alist
      (setq rails/models-alist (mapcar 'rails-class-and-table-name
                                       (rails-model-files)))))

(defun rails-models ()
  (mapcar 'car (rails-models-alist)))

(defun rails-class-and-table-name (file-name)
  (let ((class (rails-class-from-file-name file-name))
        (table (rails-table-name-from-file-name file-name)))
    `(,class . ,table)))

(defun is-rails-model-p ()
  (let ((model-regexp (concat "^" (eproject-root) "app/models")))
    (string-match model-regexp (buffer-file-name))))

(defun rails-table-name-from-file-name (file-name &optional ns)
  "get an underscored version of the current models name, passing in what to use as namespace delimiter"
  (let* ((delim-with (or ns "_"))
         (model-dir (concat (eproject-root) "app/models/"))
         (model (replace-regexp-in-string model-dir "" file-name))
         (filename (replace-regexp-in-string "/" delim-with model)))
    (replace-regexp-in-string ".rb$" "" filename)))

(defun rails-class-from-file-name (file-name)
  (let* ((table-name (rails-table-name-from-file-name file-name "::"))
         (capitalized (capitalize table-name)))
    (replace-regexp-in-string "_" "" capitalized)))

(defun rails-prompt-for-model ()
  (let* ((model (rails-class-from-file-name (buffer-file-name)))
         (initial-value (if (is-rails-model-p) model))
         (input (ido-completing-read "Model: " (rails-models) nil t initial-value)))
    (if (string= "" input) model input)))

(defun rails-table-name-for-model (model)
  (pluralize-string (cdr (assoc model rails/models-alist))))

(defun find-blueprint ()
  (interactive)
  (let* ((root (eproject-root))
         (target (rails-prompt-for-model))
         (search (concat "^" target ".blueprint")))
    (find-file (concat root "test/blueprints.rb"))
    (or (re-search-forward search nil t)
        (re-search-backward search nil t))))

(defun schema ()
  (interactive)

  (let* ((name (rails-table-name-for-model (rails-prompt-for-model)))
         (root (eproject-root))
         (regexp (concat "create_table \"" name "\"")))

    (find-file (concat root "db/schema.rb"))
    (or (re-search-forward regexp nil t)
        (re-search-backward regexp nil t))
    (message (concat "looking for " name))))

(defun format-json ()
  (interactive)
  (let ((cmd "python -mjson.tool"))
    (shell-command-on-region (region-beginning) (region-end) cmd nil t)))

(defun copy-to-end-of-line ()
  (interactive)
  (evil-yank (point) (point-at-eol)))

(defun command-t ()
  (interactive)
  (fuzzy-find-project-root (eproject-root))
  (fuzzy-find-in-project))

(defun sort-lines-random (beg end)
  "Sort lines in region randomly."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
          ((inhibit-field-text-motion t))
        (sort-subr nil 'forward-line 'end-of-line nil nil
                   (lambda (s1 s2) (eq (random 2) 0)))))))

(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (rename-file name new-name 1)
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)))))


(defun build-ctags ()
  (interactive)
  (message "building project tags")
  (let ((root (eproject-root)))
    (shell-command (concat "etags -e -R -L --verbose --excmd=n --extra=+fq --fields=+afiKlmnsSzt --file-scope=no --exclude=db --exclude=test --exclude=.git --exclude=public -f " root "TAGS " root)))
  (visit-project-tags)
  (message "tags built successfully"))

(defun build-gtags ()
  (interactive)
  (message "building gtags")
  (let ((root (eproject-root)))
    (shell-command (concat "(cd " root " && gtags)"))
    (message "tags loaded")))

(defun my-find-tag ()
  (interactive)
  (if (file-exists-p (concat (eproject-root) "TAGS"))
      (visit-project-tags)
    (build-ctags))
  (etags-select-find-tag-at-point))

(defun visit-project-tags ()
  (interactive)
  (let ((tags-file (concat (eproject-root) "TAGS")))
    (visit-tags-table tags-file)
    (message (concat "Loaded " tags-file))))

(defun set-relative-shoulda-command ()
  (setq shoulda-command (concat "(cd " (eproject-root) " && ruby \"%f\" %o)")))

(defun test-verify ()
  (interactive)
  (if (eproject-attribute :use-shoulda)
      (progn
        (set-relative-shoulda-command)
        (shoulda-verify))
    (rspec-verify)))

(defun test-verify-all ()
  (interactive)
  (if (eproject-attribute :use-shoulda)
      (progn
        (set-relative-shoulda-command)
        (shoulda-verify-all))
    (rspec-verify-all)))

(defun test-verify-single ()
  (interactive)
  (if (eproject-attribute :use-shoulda)
      (progn
        (set-relative-shoulda-command)
        (shoulda-verify-single))
    (rspec-verify-single)))

(defun test-toggle ()
  (interactive)
  (if (eproject-attribute :use-shoulda)
      (rtt/toggle-test-and-implementation)
      (rspec-toggle-spec-and-target)))

(defun insert-pry ()
  (interactive)
  (move-beginning-of-line nil)
  (insert "\n\n\n")
  (insert "**************** REMOVE ME ********************")
  (comment-or-uncomment-region-or-line)
  (insert "\nrequire 'pry'\n")
  (insert "binding.pry\n")
  (insert "**************** REMOVE ME ********************")
  (comment-or-uncomment-region-or-line)
  (insert "\n\n\n"))

(defun uniq-lines (beg end)
  "Unique lines in region.
Called from a program, there are two arguments:
BEG and END (region to sort)."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (kill-line 1)
        (yank)
        (let ((next-line (point)))
          (while
              (re-search-forward
               (format "^%s" (regexp-quote (car kill-ring))) nil t)
            (replace-match "" nil nil))
          (goto-char next-line))))))

(provide 'my-defuns)
