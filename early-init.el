(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

(setq ring-bell-function 'ignore
      compilation-scroll-output t
      frame-inhibit-implied-resize 'force
      indent-tabs-mode nil
      inhibit-splash-screen t
      inhibit-startup-buffer-menu t
      inhibit-startup-echo-area-message user-login-name
      inhibit-startup-screen t
      inhibit-x-resources t
      make-backup-files nil
      native-comp-deferred-compilation t
      package-enable-at-startup nil
      set-mark-command-repeat-pop t
      tab-width 8
      use-dialog-box nil
      use-file-dialog nil
      use-short-answers t
      vc-follow-symlinks t
      visible-bell nil)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
