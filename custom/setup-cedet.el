(require 'cc-mode)
(require 'semantic)
(require 'font-lock)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

(semantic-mode 1)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

(provide 'setup-cedet)


;; THAYUMANAVAR - setup custom format.
(setq global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(c-add-style "THAYUM"
  '("K&R"
      (c-basic-offset . 2)
      (c-comment-only-line-offset . 0)
      (c-offsets-alist . ((statement-block-intro . +)
                          (knr-argdecl-intro . 0)
                          (substatement-open . 0)
                          (label . -)
                          (statemet-cont . +)
                          (arglist-intro . c-lineup-arglist-intro-after-paren)
                          (arglist-close . c-lineup-arglist)
                          (innamespace . 0)
                          (inline-open . 0)
                          (statement-case-open . +)
                          ))
   ))

(defun mysql-c-mode-hook ()
  (interactive)
  (require 'cc-mode)
  (c-set-style "THAYUM")
  (setq indent-tabs-mode nil)
  (setq comment-column 48))

(add-hook 'c-mode-common-hook 'mysql-c-mode-hook)
