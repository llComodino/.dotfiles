(defvar efs/default-font-size 180)
(defvar efs/default-variable-font-size 180)

(defvar efs/frame-transparency '(90 . 90))

(setq gc-cons-threshold (* 50 1000 1000))

;; no-littering doesn't set this by default so we must place
;; auto save files in the same path as it uses for sessions
;; (setq auto-save-file-name-transforms
;;       `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)          ; Disable the menu bar

(column-number-mode)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(setq scroll-margin 6)
(setq scroll-conservatively 101)
(setq scroll-preserve-screen-position t)
(setq scroll-step 1)

(setq-default indent-tabs-mode nil)

(setq whitespace-style '(face tabs spaces newline space-mark tab-mark newline-mark))

(setq whitespace-display-mappings
      '((space-mark ?\  [?\u00B7] [?.])
        (newline-mark ?\n [?\u21B5 ?\n])
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(add-hook 'prog-mode-hook 'whitespace-mode)

;; Set frame transparency
(set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(set-face-attribute 'default nil :font "IosevkaTerm NFM" :height efs/default-font-size)
(set-face-attribute 'fixed-pitch nil :font "IosevkaTerm NFM" :height efs/default-font-size)
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height efs/default-variable-font-size :weight 'regular)

