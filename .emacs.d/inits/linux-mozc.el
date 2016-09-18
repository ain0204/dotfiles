;; ---
;;
;; mozc
;; 
;; mozcより先に (set-language-environment "Japanese")
;; mozcより後に (prefer-coding-system 'utf-8)
;; で設定しないとおかしくなってたこともあった
;; ---
(require 'mozc)

;;(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
;; ミニバッファに表示する
(setq mozc-candidate-style 'echo-area)

;; Change cursor color depending on IBus status
(setq ibus-cursor-color '("limegreen" "red" "red"))

(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)

(add-hook 'mozc-mode-hook
(lambda()
  (define-key mozc-mode-map (kbd "<zenkaku-hankaku>") 'toggle-input-method)))

;; mozc on/off で色を変える
(add-hook 'input-method-activate-hook
          (lambda() (set-cursor-color "dark orange")))
(add-hook 'input-method-inactivate-hook
          (lambda() (set-cursor-color "white smoke")))
