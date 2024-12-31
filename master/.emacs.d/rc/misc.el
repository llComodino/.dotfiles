(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(rc/require 'elcord)
(require 'elcord)
(use-package elcord
  :ensure t
  :config
  (elcord-mode))

(rc/require 'nerd-icons)
(require 'nerd-icons)
(use-package nerd-icons
  :ensure t)

(rc/require 'nerd-icons-dired)
(require 'nerd-icons-dired)
(use-package nerd-icons-dired
  :ensure t
  :hook (dired-mode . nerd-icons-dired-mode))
