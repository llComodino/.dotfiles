(setq gc-cons-threshold (* 50 1000 1000))

(setq auto-save-file-name-transforms
    `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)

(column-number-mode)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(setq redisplay-dont-pause t
      scroll-margin 6
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(pixel-scroll-precision-mode t)

(setq-default indent-tabs-mode nil)

(setq whitespace-style '(face tabs spaces newline space-mark tab-mark newline-mark))

(setq whitespace-display-mappings
      '((space-mark ?\  [?\u00B7] [?.])
        (newline-mark ?\n [?\u21B5 ?\n])
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(add-hook 'prog-mode-hook 'whitespace-mode)

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
