;;---------------------------------------
;;
;; color-moccur
;;---------------------------------------
(when (require 'color-moccur nil t)
  ;; "M-o" にoccur-by-moccur を割り当て
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; スペース区切りでアンド検索
  (setq moccur-split-word t)			    
  ;; ;; ディレクトリ検索のときに除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  ;; ;;Migemoを利用できる環境であればMigemoを使う
  (when (and (executable-find "cmigemo")
  	     (require 'migemo nil t))
    (setq moccur-use-migemo t))
  )
;; 参考までに、これはカレントバッファのみの検索です
;; 全バッファに対して行いたいなら M-x moccur で。


;;---------------------------------------
;;
;; moccur-edit
;; moccur中に r で起動
;; C-x C-sで反映。C-c C-uとかで編集破棄
;;---------------------------------------
(require 'moccur-edit nil t)


;; ---
;;
;; helmから使えるようにする
;; ref: http://blog.shibayu36.org/entry/2013/10/19/191958
;; ---
(require 'helm-config)
(global-set-key (kbd "C-M-o") 'helm-occur)
;; (define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)
;; (define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur)
