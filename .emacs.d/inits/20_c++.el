;; ---
;;
;; C++ まわりの設定
;; ---

;;ヘッダファイル(.h)をc++モードで開く
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode))
              auto-mode-alist))
