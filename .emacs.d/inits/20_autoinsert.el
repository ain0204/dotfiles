;; ---
;; 
;; ファイル作成時にテンプレートを使用
;; Ref: http://www.02.246.ne.jp/~torutk/cxx/emacs/mode_extension.html
;; Ref: http://d.hatena.ne.jp/higepon/20080731/1217491155
;; ---
(require 'autoinsert)
;; テンプレート格納用ディレクトリ
(setq auto-insert-directory "~/.emacs.d/insert/")
;; ファイル拡張子とテンプレートの対応
(setq auto-insert-alist
      (append '(
               ("\\.cpp$" . ["template.cpp" my-template])
               ("\\.h$" . ["template.h" my-template])
	       ("\\.py$" . ["template.py" my-template])
	       ("\\.tex$" . ["template.tex" my-template])
              ) auto-insert-alist))
(add-hook 'find-file-hooks 'auto-insert)

(require 'cl)
(defvar template-replacements-alists
  '(("%file%"             . (lambda () (file-name-nondirectory (buffer-file-name))))
    ("%file-without-ext%" . (lambda () (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
    ("%include-guard%"    . (lambda () (format "__%s_H_INCLUDED__" (upcase (file-name-sans-extension (file-name-nondirectory buffer-file-name))))))))
  
(defun my-template ()
  (time-stamp)
  (mapc #'(lambda(c)
            (progn
              (goto-char (point-min))
              (replace-string (car c) (funcall (cdr c)) nil)))
        template-replacements-alists)
  (goto-char (point-max))
  (message "done."))

(add-hook 'find-file-not-found-hooks 'auto-insert)