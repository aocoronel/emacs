(put 'downcase-region 'disabled nil)

(setq native-comp-async-query-on-exit t)

(setq read-answer-short t)
(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add 'yes-or-no-p :override #'y-or-n-p))

(setq undo-limit (* 13 160000)
      undo-strong-limit (* 13 240000)
      undo-outer-limit (* 13 24000000))

(setq truncate-string-ellipsis "…")

(setq eval-expression-print-length nil
      eval-expression-print-level nil)

(setq x-underline-at-descent-line t)

;; (setq remote-file-name-inhibit-cache 50)
;;
;; (setq imenu-auto-rescan t)
;; (setq imenu-max-item-length 160)
;; (setq next-line-add-newlines nil)
;; (setq bookmark-save-flag 1)
;;
;; (setq uniquify-buffer-name-style 'forward)

(setq create-lockfiles nil)
(setq make-backup-files t)

(setq backup-directory-alist
      `(("." . ,(expand-file-name "backup" user-emacs-directory))))
(setq tramp-backup-directory-alist backup-directory-alist)
(setq backup-by-copying-when-linked t)
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq version-control t)
(setq kept-new-versions 5)
(setq kept-old-versions 5)

(setq auto-save-include-big-deletions t)

(setq auto-save-list-file-prefix
      (expand-file-name "autosave/" user-emacs-directory))
(setq tramp-auto-save-directory
      (expand-file-name "tramp-autosave/" user-emacs-directory))

(setq auto-save-no-message t)
(setq auto-save-default t)
(setq auto-save-interval 300)
(setq auto-save-timeout 30)

(setq vc-git-print-log-follow t)
(setq vc-make-backup-files nil)
(setq kept-old-versions 10)
(setq kept-new-versions 10)
(setq vc-git-diff-switches '("--histogram"))

(setq kill-buffer-delete-auto-save-files t)
(setq kill-do-not-save-duplicates t)

(setq revert-without-query (list ".")  ; Do not prompt
      auto-revert-stop-on-user-input nil
      auto-revert-verbose t)

(setq global-auto-revert-non-file-buffers t)
(setq global-auto-revert-ignore-modes '(Buffer-menu-mode))

(setq auto-revert-interval 3)
(setq auto-revert-remote-files nil)
(setq auto-revert-use-notify t)
(setq auto-revert-avoid-polling nil)
(setq auto-revert-verbose t)
(add-hook 'emacs-startup-hook #'global-auto-revert-mode)

(setq save-place-file (expand-file-name "saveplace" user-emacs-directory))
(setq save-place-limit 600)
(setq savehist-additional-variables
  '(kill-ring                        ; clipboard
    register-alist                   ; macros
    mark-ring global-mark-ring       ; marks
    search-ring regexp-search-ring))

(setq history-length 300)
(setq savehist-save-minibuffer-history t)  ;; Default
(setq savehist-additional-variables
      '(kill-ring                        ; clipboard
        register-alist                   ; macros
        mark-ring global-mark-ring       ; marks
        search-ring regexp-search-ring)) ; searches

(setq window-resize-pixelwise nil)

(setq window-divider-default-bottom-width 1
      window-divider-default-places t
      window-divider-default-right-width 1)

(setq redisplay-skip-fontification-on-input t)

(setq fast-but-imprecise-scrolling t)

(setq auto-window-vscroll nil)

(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

(setq global-text-scale-adjust-resizes-frames nil)

(setq comment-multi-line t)
(setq comment-empty-lines t)


(setq sentence-end-double-space nil)
(setq lazy-highlight-initial-delay 0)
