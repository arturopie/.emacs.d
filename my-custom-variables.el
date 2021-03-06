(defvar my-global-externs '("it" "loadFixtures" "expect" "describe" "beforeEach" "spyOn" "jasmine"
                            "$" "$j" "Mustache" "jQuery" "_" "qcloud" "Nulogy" "qc" "Backbone" "JST"
                            "afterEach" "setFixtures" "require" "Handlebars"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-buffer-maximum-size 20000)
 '(comint-completion-addsuffix t)
 '(comint-completion-autolist t)
 '(comint-get-old-input (lambda nil "") t)
 '(comint-input-ignoredups t)
 '(comint-input-ring-size 5000)
 '(comint-move-point-for-output nil)
 '(comint-prompt-read-only nil)
 '(comint-scroll-show-maximum-output t)
 '(comint-scroll-to-bottom-on-input t)
 '(js2-always-indent-assigned-expr-in-decls-p t)
 '(js2-auto-indent-p t)
 '(js2-basic-offset 2)
 '(js2-consistent-level-indent-inner-bracket-p t)
 '(js2-enter-indents-newline t)
 '(js2-highlight-level 3)
 '(js2-indent-on-enter-key t)
 '(js2-mirror-mode nil)
 '(js2-strict-missing-semi-warning nil)
 '(js3-global-externs my-global-externs)
 '(mumamo-chunk-coloring 1)
 '(protect-buffer-bury-p nil)
 '(tramp-default-method "ssh"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anything-header ((((class color)) (:background "#81908F" :foreground "#fcf4dc"))))
 '(clojure-test-error-face ((((class color) (background light)) (:underline "#a57705"))))
 '(clojure-test-failure-face ((((class color) (background light)) (:underline "#c60007"))))
 '(clojure-test-success-face ((((class color) (background light)) (:background "#728a05" :foreground "#fcf4dc"))))
 '(erb-face ((((class color) (min-colors 88) (background light)) (:background "#fcf4dc"))))
 '(flymake-errline ((((class color)) (:underline "#c60007"))))
 '(flymake-warnline ((((class color)) (:underline "#2075c7"))))
 '(hl-paren-face ((t (:weight bold))) t)
 '(isearch ((((class color)) (:background "#a57705" :underline "#a57705" :bold t :foreground "#fcf4dc"))))
 '(js2-error-face ((((class color) (background light)) (:foreground "#c60007"))))
 '(js2-external-variable-face ((t (:foreground "#bd3612"))))
 '(js2-function-param-face ((t (:foreground "#ffd700"))))
 '(lazy-highlight ((((class color)) (:underline "#5859b7" :foreground "#5859b7" :background "#fcf4dc"))))
 '(magit-branch ((((class color)) (:background "#81908F" :foreground "#FCF4DC"))))
 '(magit-diff-add ((((class color)) (:foreground "#728a05"))))
 '(magit-diff-del ((((class color)) (:foreground "#c60007"))))
 '(magit-item-highlight ((((class color)) (:background "#152028"))))
 '(magit-section-title ((((class color)) (:background "#81908F" :foreground "#FCF4DC"))))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background light)) nil)))
 '(mumamo-border-face-in ((t (:inherit font-lock-preprocessor-face :weight bold))))
 '(mumamo-border-face-out ((t (:inherit font-lock-preprocessor-face :weight bold))))
 '(rainbow-delimiters-depth-1-face ((((class color)) (:foreground "#c60007"))))
 '(rainbow-delimiters-depth-2-face ((((class color)) (:foreground "#a57705"))))
 '(rainbow-delimiters-depth-3-face ((((class color)) (:foreground "#bd3612"))))
 '(rainbow-delimiters-depth-4-face ((((class color)) (:foreground "#c61b6e"))))
 '(rainbow-delimiters-depth-5-face ((((class color)) (:foreground "#5859b7"))))
 '(rainbow-delimiters-depth-6-face ((((class color)) (:foreground "#2075c7"))))
 '(rainbow-delimiters-depth-7-face ((((class color)) (:foreground "#259185"))))
 '(rainbow-delimiters-depth-8-face ((((class color)) (:foreground "#728a05"))))
 '(rainbow-delimiters-depth-9-face ((((class color)) (:foreground "#042028"))))
 '(trailing-whitespace ((t (:background "#c7c0a9" :foreground "#e9e2cb" :inverse-video t))))
 '(web-mode-css-prop-face ((t (:foreground "sky blue"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground "dark goldenrod"))))
 '(web-mode-css-rule-face ((t (:foreground "gold"))))
 '(web-mode-html-attr-name-face ((t (:foreground "light sky blue"))))
 '(web-mode-html-tag-face ((t (:foreground "gold2")))))
