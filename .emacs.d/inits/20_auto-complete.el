;; ---
;;
;; auto-complete
;; ---
(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "C-TAB") ;; トリガーキー
(setq ac-use-menu-map t) ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t) ;; 曖昧マッチ
