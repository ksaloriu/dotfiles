
(add-hook 'go-mode-hook
	  (lambda () (setq tab-width 4)))

(add-hook 'go-mode-hook 'electric-pair-local-mode)
	  
