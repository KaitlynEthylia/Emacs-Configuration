(require 'org)
(setq package-enable-at-startup nil
      org-babel-default-header-args
      (cons '(:tangle . "yes")
	    (assq-delete-all :tangle org-babel-default-header-args)))

(defun build-init ()
  (when (equal (buffer-file-name)
	       (expand-file-name "README.org" user-emacs-directory))
    (let ((prog-mode-hook nil))
      (org-babel-tangle))))
(add-hook 'after-save-hook 'build-init)

(unless (file-exists-p (expand-file-name "init.el" user-emacs-directory))
  (find-file (expand-file-name "README.org" user-emacs-directory))
  (org-babel-tangle))
