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

(add-hook 'prog-mode-hook (lambda () (setq tab-width 2)))
(add-hook 'prog-mode-hook (lambda () (eglot-ensure)))

(setq-default eglot-workspace-configuration
              '(:clangd (:fallbackFlags ["--style=GNU"])))

(when (not (display-graphic-p))
  (dolist (key '([mouse-1] [mouse-2] [mouse-3] [down-mouse-1] [down-mouse-2] [down-mouse-3]
                 [drag-mouse-1] [drag-mouse-2] [drag-mouse-3]
                 [double-mouse-1] [double-mouse-2] [double-mouse-3]
                 [triple-mouse-1] [triple-mouse-2] [triple-mouse-3]))
    (global-unset-key key)))
