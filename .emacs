;;; init.el --- GNU/RMS-style Emacs defaults -*- lexical-binding: t; -*-

;;; Commentary:
;; Richard Stallman's private Emacs configuration is not published as a
;; complete dotfile.  This file keeps Emacs close to stock GNU Emacs, avoids
;; non-GNU package archives, and makes the installed GNU manuals easy to use.

;;; Code:

;; Prefer local, self-documenting GNU Emacs features.
(setq inhibit-startup-screen nil
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil
      sentence-end-double-space t
      require-final-newline t
      next-line-add-newlines nil
      save-interprogram-paste-before-kill t
      apropos-do-all t
      help-window-select t)

;; Keep package sources GNU-only.
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Classic, keyboard-oriented editing.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode 1))
(blink-cursor-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil
              fill-column 70)
(add-hook 'text-mode-hook #'turn-on-auto-fill)

;; Prefer Info and local GNU documentation.
(require 'seq)
(setq Info-default-directory-list
      (seq-uniq
       (append Info-default-directory-list
               '("/usr/share/info/"
                 "/usr/local/share/info/"))))
(defun ckb/info-or-install-note (node package)
  "Open Info NODE, or say which PACKAGE provides it."
  (condition-case nil
      (info node)
    (user-error
     (message "Install %s first, then reopen %s" package node))))
(global-set-key (kbd "C-h I") #'info)
(global-set-key (kbd "C-h G") (lambda ()
                                (interactive)
                                (ckb/info-or-install-note
                                 "(standards)Top" "gnu-standards")))
(global-set-key (kbd "C-h E") (lambda ()
                                (interactive)
                                (ckb/info-or-install-note
                                 "(emacs)Top" "emacs-common-gfdl")))
(global-set-key (kbd "C-h L") (lambda ()
                                (interactive)
                                (ckb/info-or-install-note
                                 "(elisp)Top" "emacs-common-gfdl")))

;; Mail/news tools included with GNU Emacs.
(setq mail-user-agent 'message-user-agent
      read-mail-command 'rmail)

;; Use GNU-style backups without scattering files through working trees.
(setq backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      backup-directory-alist `(("." . ,(expand-file-name "backups/"
                                                       user-emacs-directory))))

;;; init.el ends here
