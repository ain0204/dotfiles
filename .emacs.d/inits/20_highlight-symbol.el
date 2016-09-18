;; ---
;;
;; highlight-symbol
;; ---
(require 'highlight-symbol)
;; 1秒後自動ハイライトされるようになる
(setq highlight-symbol-idle-delay 1.0)
;; 自動ハイライトをしたいならば
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
;; ソースコードにおいてM-p/M-nでシンボル間を移動
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
;; 色をつける（global-hl-line-modeとの兼ね合いで変になるけど...）
(global-set-key [(control f3)] 'highlight-symbol)
;; シンボル置換
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)
