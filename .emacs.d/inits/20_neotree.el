;; ---
;;
;; NeoTree
;; C: ルートディレクトリの変更
;; c, +, p: ファイル作成
;; d: ファイル削除
;; r: ファイル名変更
;; e: ディレクトリを開く
;; ---
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; 隠しファイルをデフォルトで表示
(setq neo-show-hidden-files t)
;; delete-other-window で neotree ウィンドウを消さない
(setq neo-persist-show t)
;; キーバインドをシンプルにする
(setq neo-keymap-style 'concise)
;; neotree ウィンドウを表示する毎に current file のあるディレクトリを表示する
(setq neo-smart-open t)
