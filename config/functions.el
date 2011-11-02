(defun new-line-in-normal-mode ()
  "make a new line without moving the cursor or leaving normal mode"
  (interactive)
  (evil-set-marker ?z)
  (evil-insert-newline-below)
  (evil-force-normal-state)
  (evil-goto-mark ?z))

(defun hex-codes (limit) 
  (remove-overlays (point) limit 'fontify-hex-colors t) 
  (while (re-search-forward "\\(#[[:xdigit:]]\\{6\\}\\)" limit t) 
    (let ((ov (make-overlay (match-beginning 0) 
                            (match-end 0)))) 
      (overlay-put ov 'face  (list :background (match-string 1))) 
      (overlay-put ov 'fontify-hex-colors t) 
      (overlay-put ov 'evaporate t))) 
  ;; return nil telling font-lock not to fontify anything from this 
  ;; function 
  nil) 

(defalias 'git-blame 'vc-annotate)