;; ---
;;
;; hlinum
;; いい感じに行数を表示する
;; ---
(require 'hlinum)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum-highlight-face ((t (:foreground "black" :background "#888888")))))
(hlinum-activate)
(setq linum-format "%3d ")
(global-linum-mode t)
