(require 'elscreen)
(elscreen-start)
;;; タブの先頭に[X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;;; header-lineの先頭に[<->]を表示しない
(setq elscreen-tab-display-control nil)

;; タブを表示(非表示にする場合は nil を設定する)
(setq elscreen-display-tab nil)
;; (setq elscreen-display-tab-flag nil)
;; (defun elscreen-display-tab-toggle()
;;   (interactive)
;;   (if (equal elscreen-display-tab t)
;;       (progn
;; 	(setq elscreen-display-tab nil)
;; 	(setq elscreen-display-tab-flag nil))
;;     (progn
;;       (setq elscreen-display-tab t)
;;       (setq elscreen-display-tab-flag t))))
;; (define-key global-map (kbd "C-z t") 'elscreen-display-tab-toggle)
;; (define-key global-map (kbd "C-z C-z") 'helm-elscreen)
