(load-theme 'monokai t)

;;
;; auto-compleate
;;
(set-face-background 'ac-candidate-face "lightgray")
(set-face-foreground 'ac-candidate-face "black"    )
(set-face-underline  'ac-candidate-face "darkgray" )
(set-face-background 'ac-selection-face "steelblue")

(set-face-foreground 'popup-summary-face "white") ;; 候補のサマリー部分
(set-face-background 'popup-tip-face "lightgray") ;; ドキュメント部分
(set-face-foreground 'popup-tip-face "black"    )


;; コメントの色が気に入らないので変更
(set-face-foreground 'font-lock-comment-delimiter-face "YellowGreen")
(set-face-foreground 'font-lock-comment-face "YellowGreen")
;; Regionの色
;; (set-face-foreground 'region "white")
;; (set-face-background 'region "dimgray")
(set-face-foreground 'region "white")
(set-face-background 'region "honeydew4")
