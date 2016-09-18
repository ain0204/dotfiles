;; ---
;;
;; jebi
;; sudo pacman -S python-virtualenv
;; M-x jedi:install-server
;; ---
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
