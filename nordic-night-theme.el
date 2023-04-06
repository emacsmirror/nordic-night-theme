;;; nordic-night-theme.el --- A darker, more colorful version of the lovely Nord theme -*- lexical-binding: t -*-

;; Copyright (c) 2023 Ashton Wiersdorf

;; Title: Nordic-Night Theme
;; Author: Ashton Wiersdorf <mail@wiersdorf.dev>
;; Created: 2023
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.1"))
;; License: MIT
;; Homepage: https://sr.ht/~ashton314/nordic-night/

;;; Commentary:

;; Nordic-Night is a modification of the lovely Nord theme.

;;; Code:

(unless (>= emacs-major-version 24)
  (error "Nordic-Night theme requires Emacs 24.1 or later!"))

(deftheme nordic-night "A darker, more colorful version of the lovely Nord theme")

(defgroup nordic-night nil
  "Nordic-Night theme customizations.
  The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom nordic-night-region-highlight nil
  "Allows to set a region highlight style based on the Nordic-Night components.
  Valid styles are
    - 'snowstorm' - Uses 'nordic-night-dark0' as foreground- and 'nordic-night-snowy4' as background color
    - 'frost' - Uses 'nordic-night-dark0' as foreground- and 'nordic-night-brightblue8' as background color"
  :type 'string
  :group 'nordic-night)

(defcustom nordic-night-uniform-mode-lines nil
  "Enables uniform activate- and inactive mode lines using 'nordic-night-dark3' as background."
  :type 'boolean
  :group 'nordic-night)

(setq nordic-night-theme--brightened-comments '("#4c566a" "#4e586d" "#505b70" "#525d73" "#556076" "#576279" "#59647c" "#5b677f" "#5d6982" "#5f6c85" "#616e88" "#63718b" "#66738e" "#687591" "#6a7894" "#6d7a96" "#6f7d98" "#72809a" "#75829c" "#78859e" "#7b88a1"))

(defun nordic-night--fullcolorp ()
  "Returns whether the display can display nordic-night colors"
  (or (>= (display-color-cells) 16777216) (display-graphic-p)))

;;;; Color Constants
(let ((class '((class color) (min-colors 89)))
      (nordic-night-nearblack    (if (nordic-night--fullcolorp) "#121212" "black"))
      (nordic-night-lighterblack (if (nordic-night--fullcolorp) "#181818" "black"))
      (nordic-night-dark0        (if (nordic-night--fullcolorp) "#2E3440" "black"))
      (nordic-night-dark1        (if (nordic-night--fullcolorp) "#3B4252" "black"))
      (nordic-night-dark2        (if (nordic-night--fullcolorp) "#434C5E" "#434C5E"))
      (nordic-night-dark3        (if (nordic-night--fullcolorp) "#4C566A" "brightblack"))
      (nordic-night-lessdark3-1  (if (nordic-night--fullcolorp) "#6B7386" "#6B7386"))
      (nordic-night-lessdark3-2  (if (nordic-night--fullcolorp) "#8892A4" "#8892A4"))
      (nordic-night-lessdark3-3  (if (nordic-night--fullcolorp) "#B5BDCC" "#B5BDCC"))
      (nordic-night-snowy4       (if (nordic-night--fullcolorp) "#D8DEE9" "#D8DEE9"))
      (nordic-night-snowy5       (if (nordic-night--fullcolorp) "#E5E9F0" "white"))
      (nordic-night-snowy6       (if (nordic-night--fullcolorp) "#ECEFF4" "brightwhite"))
      (nordic-night-bluegreen7   (if (nordic-night--fullcolorp) "#8FBCBB" "cyan"))
      (nordic-night-brightblue8  (if (nordic-night--fullcolorp) "#88C0D0" "brightcyan"))
      (nordic-night-lapis9       (if (nordic-night--fullcolorp) "#81A1C1" "blue"))
      (nordic-night-blue10       (if (nordic-night--fullcolorp) "#5E81AC" "brightblue"))
      (nordic-night-red11        (if (nordic-night--fullcolorp) "#BF616A" "red"))
      (nordic-night-orange12     (if (nordic-night--fullcolorp) "#D08770" "brightyellow"))
      (nordic-night-yellow13     (if (nordic-night--fullcolorp) "#EBCB8B" "yellow"))
      (nordic-night-green14      (if (nordic-night--fullcolorp) "#A3BE8C" "green"))
      (nordic-night-purple15     (if (nordic-night--fullcolorp) "#B48EAD" "magenta"))
      (nordic-night-annotation   (if (nordic-night--fullcolorp) "#D08770" "brightyellow"))
      (nordic-night-attribute    (if (nordic-night--fullcolorp) "#8FBCBB" "cyan"))
      (nordic-night-class        (if (nordic-night--fullcolorp) "#8FBCBB" "cyan"))
      (nordic-night-comment      (if (nordic-night--fullcolorp) "#8892A4" "brightblack"))
      (nordic-night-doc          (if (nordic-night--fullcolorp) "#A3BE8C" "green"))
      (nordic-night-escape       (if (nordic-night--fullcolorp) "#D08770" "brightyellow"))
      (nordic-night-method       (if (nordic-night--fullcolorp) "#88C0D0" "brightcyan"))
      (nordic-night-keyword      (if (nordic-night--fullcolorp) "#81A1C1" "blue"))
      (nordic-night-numeric      (if (nordic-night--fullcolorp) "#B48EAD" "magenta"))
      (nordic-night-operator     (if (nordic-night--fullcolorp) "#81A1C1" "blue"))
      (nordic-night-preprocessor (if (nordic-night--fullcolorp) "#5E81AC" "brightblue"))
      (nordic-night-punctuation  (if (nordic-night--fullcolorp) "#D8DEE9" "#D8DEE9"))
      (nordic-night-regexp       (if (nordic-night--fullcolorp) "#EBCB8B" "yellow"))
      (nordic-night-string       (if (nordic-night--fullcolorp) "#A3BE8C" "green"))
      (nordic-night-tag          (if (nordic-night--fullcolorp) "#81A1C1" "blue"))
      (nordic-night-variable     (if (nordic-night--fullcolorp) "#D8DEE9" "#D8DEE9"))
      (nordic-night-region-highlight-foreground (if (or
                                                     (string= nordic-night-region-highlight "frost")
                                                     (string= nordic-night-region-highlight "snowstorm")) "#2E3440" nil))
      (nordic-night-region-highlight-background (if
                                                    (string= nordic-night-region-highlight "frost") "#88C0D0"
                                                  (if (string= nordic-night-region-highlight "snowstorm") "#D8DEE9" "#434C5E"))))

;;;; +------------+
;;;; + Core Faces +
;;;; +------------+
  (custom-theme-set-faces
   'nordic-night
   ;; +--- Base ---+
   `(bold ((,class (:weight bold))))
   `(bold-italic ((,class (:weight bold :slant italic))))
   `(default ((,class (:foreground ,nordic-night-snowy4 :background ,nordic-night-nearblack))))
   `(error ((,class (:foreground ,nordic-night-red11 :weight bold))))
   `(escape-glyph ((,class (:foreground ,nordic-night-orange12))))
   `(font-lock-builtin-face ((,class (:foreground ,nordic-night-lapis9))))
   `(font-lock-comment-face ((,class (:foreground ,nordic-night-comment :weight light))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,nordic-night-comment))))
   `(font-lock-constant-face ((,class (:foreground ,nordic-night-lapis9))))
   `(font-lock-doc-face ((,class (:foreground ,nordic-night-doc))))
   `(font-lock-function-name-face ((,class (:foreground ,nordic-night-brightblue8))))
   `(font-lock-keyword-face ((,class (:foreground ,nordic-night-purple15))))
   `(font-lock-negation-char-face ((,class (:foreground ,nordic-night-lapis9))))
   `(font-lock-preprocessor-face ((,class (:foreground ,nordic-night-blue10 :weight bold))))
   `(font-lock-reference-face ((,class (:foreground ,nordic-night-lapis9))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,nordic-night-yellow13))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,nordic-night-yellow13))))
   `(font-lock-string-face ((,class (:foreground ,nordic-night-green14))))
   `(font-lock-type-face ((,class (:foreground ,nordic-night-green14))))
   `(font-lock-variable-name-face ((,class (:foreground ,nordic-night-brightblue8))))
   `(font-lock-warning-face ((,class (:foreground ,nordic-night-orange12))))
   `(italic ((,class (:slant italic :foreground ,nordic-night-brightblue8))))
   `(shadow ((,class (:foreground ,nordic-night-dark3))))
   `(line-number-current-line ((,class (:foreground ,nordic-night-lessdark3-2))))
   `(underline ((,class (:underline t))))
   `(warning ((,class (:foreground ,nordic-night-yellow13 :weight bold))))

   ;; +--- Syntax ---+
   ;; > C
   `(c-annotation-face ((,class (:foreground ,nordic-night-annotation))))

   ;; > diff
   `(diff-added ((,class (:foreground ,nordic-night-green14))))
   `(diff-changed ((,class (:foreground ,nordic-night-yellow13))))
   `(diff-context ((,class (:inherit default))))
   `(diff-file-header ((,class (:foreground ,nordic-night-brightblue8))))
   `(diff-function ((,class (:foreground ,nordic-night-bluegreen7))))
   `(diff-header ((,class (:foreground ,nordic-night-lapis9 :weight bold))))
   `(diff-hunk-header ((,class (:foreground ,nordic-night-lapis9 :background ,nordic-night-dark0))))
   `(diff-indicator-added ((,class (:foreground ,nordic-night-green14))))
   `(diff-indicator-changed ((,class (:foreground ,nordic-night-yellow13))))
   `(diff-indicator-removed ((,class (:foreground ,nordic-night-red11))))
   `(diff-nonexistent ((,class (:foreground ,nordic-night-red11))))
   `(diff-refine-added ((,class (:foreground ,nordic-night-green14))))
   `(diff-refine-changed ((,class (:foreground ,nordic-night-yellow13))))
   `(diff-refine-removed ((,class (:foreground ,nordic-night-red11))))
   `(diff-removed ((,class (:foreground ,nordic-night-red11))))

   ;; +--- UI ---+
   `(border ((,class (:foreground ,nordic-night-snowy4))))
   `(buffer-menu-buffer ((,class (:foreground ,nordic-night-snowy4 :weight bold))))
   `(button ((,class (:background ,nordic-night-dark0 :foreground ,nordic-night-brightblue8 :box (:line-width 2 :color ,nordic-night-snowy4 :style sunken-button)))))
   `(completions-annotations ((,class (:foreground ,nordic-night-lapis9))))
   `(completions-common-part ((,class (:foreground ,nordic-night-brightblue8 :weight bold))))
   `(completions-first-difference ((,class (:foreground ,nordic-night-red11))))
   `(custom-button ((,class (:background ,nordic-night-dark0 :foreground ,nordic-night-brightblue8 :box (:line-width 2 :color ,nordic-night-snowy4 :style sunken-button)))))
   `(custom-button-mouse ((,class (:background ,nordic-night-snowy4 :foreground ,nordic-night-dark0 :box (:line-width 2 :color ,nordic-night-snowy4 :style sunken-button)))))
   `(custom-button-pressed ((,class (:background ,nordic-night-snowy6 :foreground ,nordic-night-dark0 :box (:line-width 2 :color ,nordic-night-snowy4 :style sunken-button)))))
   `(custom-button-pressed-unraised ((,class (:background ,nordic-night-snowy4 :foreground ,nordic-night-dark0 :box (:line-width 2 :color ,nordic-night-snowy4 :style sunken-button)))))
   `(custom-button-unraised ((,class (:background ,nordic-night-dark0 :foreground ,nordic-night-brightblue8 :box (:line-width 2 :color ,nordic-night-snowy4 :style sunken-button)))))
   `(custom-changed ((,class (:foreground ,nordic-night-yellow13))))
   `(custom-comment ((,class (:foreground ,nordic-night-comment))))
   `(custom-comment-tag ((,class (:foreground ,nordic-night-bluegreen7))))
   `(custom-documentation ((,class (:foreground ,nordic-night-snowy4))))
   `(custom-group-tag ((,class (:foreground ,nordic-night-brightblue8 :weight bold))))
   `(custom-group-tag-1 ((,class (:foreground ,nordic-night-brightblue8 :weight bold))))
   `(custom-invalid ((,class (:foreground ,nordic-night-red11))))
   `(custom-modified ((,class (:foreground ,nordic-night-yellow13))))
   `(custom-rogue ((,class (:foreground ,nordic-night-orange12 :background ,nordic-night-dark2))))
   `(custom-saved ((,class (:foreground ,nordic-night-green14))))
   `(custom-set ((,class (:foreground ,nordic-night-brightblue8))))
   `(custom-state ((,class (:foreground ,nordic-night-green14))))
   `(custom-themed ((,class (:foreground ,nordic-night-brightblue8 :background ,nordic-night-dark2))))
   `(cursor ((,class (:background ,nordic-night-snowy4))))
   `(fringe ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-lighterblack))))
   `(file-name-shadow ((,class (:inherit shadow))))
   `(header-line ((,class (:foreground ,nordic-night-snowy4 :background ,nordic-night-dark2))))
   `(help-argument-name ((,class (:foreground ,nordic-night-brightblue8))))
   `(highlight ((,class (:foreground ,nordic-night-brightblue8 :background ,nordic-night-dark2))))
   `(hl-line ((,class (:background ,nordic-night-lighterblack))))
   `(info-menu-star ((,class (:foreground ,nordic-night-lapis9))))
   `(isearch ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-brightblue8))))
   `(isearch-fail ((,class (:foreground ,nordic-night-red11))))
   `(link ((,class (:underline t))))
   `(link-visited ((,class (:underline t))))
   `(linum ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-dark0))))
   `(linum-relative-current-face ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-dark0))))
   `(match ((,class (:inherit isearch))))
   `(message-cited-text ((,class (:foreground ,nordic-night-snowy4))))
   `(message-header-cc ((,class (:foreground ,nordic-night-lapis9))))
   `(message-header-name ((,class (:foreground ,nordic-night-bluegreen7))))
   `(message-header-newsgroup ((,class (:foreground ,nordic-night-green14))))
   `(message-header-other ((,class (:foreground ,nordic-night-snowy4))))
   `(message-header-subject ((,class (:foreground ,nordic-night-brightblue8))))
   `(message-header-to ((,class (:foreground ,nordic-night-lapis9))))
   `(message-header-xheader ((,class (:foreground ,nordic-night-yellow13))))
   `(message-mml ((,class (:foreground ,nordic-night-blue10))))
   `(message-separator ((,class (:inherit shadow))))
   `(minibuffer-prompt ((,class (:foreground ,nordic-night-brightblue8 :weight bold))))
   `(mm-command-output ((,class (:foreground ,nordic-night-brightblue8))))
   `(mode-line ((,class (:foreground ,nordic-night-snowy4 :background ,nordic-night-dark3 :width normal))))
   `(mode-line-inactive ((,class (:foreground ,nordic-night-blue10 :background ,nordic-night-dark0 :width normal))))
   `(mode-line-buffer-id ((,class (:weight bold))))
   `(mode-line-highlight ((,class (:inherit highlight))))
   `(next-error ((,class (:inherit error))))
   `(nobreak-space ((,class (:foreground ,nordic-night-dark3))))
   `(outline-1 ((,class (:foreground ,nordic-night-brightblue8 :weight bold))))
   `(outline-2 ((,class (:inherit outline-1))))
   `(outline-3 ((,class (:inherit outline-1))))
   `(outline-4 ((,class (:inherit outline-1))))
   `(outline-5 ((,class (:inherit outline-1))))
   `(outline-6 ((,class (:inherit outline-1))))
   `(outline-7 ((,class (:inherit outline-1))))
   `(outline-8 ((,class (:inherit outline-1))))
   `(package-description ((,class (:foreground ,nordic-night-snowy4))))
   `(package-help-section-name ((,class (:foreground ,nordic-night-brightblue8 :weight bold))))
   `(package-name ((,class (:foreground ,nordic-night-brightblue8))))
   `(package-status-available ((,class (:foreground ,nordic-night-bluegreen7))))
   `(package-status-avail-obso ((,class (:foreground ,nordic-night-bluegreen7 :slant italic))))
   `(package-status-built-in ((,class (:foreground ,nordic-night-lapis9))))
   `(package-status-dependency ((,class (:foreground ,nordic-night-brightblue8 :slant italic))))
   `(package-status-disabled ((,class (:foreground ,nordic-night-dark3))))
   `(package-status-external ((,class (:foreground ,nordic-night-orange12 :slant italic))))
   `(package-status-held ((,class (:foreground ,nordic-night-snowy4 :weight bold))))
   `(package-status-new ((,class (:foreground ,nordic-night-green14))))
   `(package-status-incompat ((,class (:foreground ,nordic-night-red11))))
   `(package-status-installed ((,class (:foreground ,nordic-night-bluegreen7 :weight bold))))
   `(package-status-unsigned ((,class (:underline ,nordic-night-yellow13))))
   `(query-replace ((,class (:foreground ,nordic-night-brightblue8 :background ,nordic-night-dark2))))
   ;; `(region ((,class (:foreground ,nordic-night-region-highlight-foreground :background ,nordic-night-region-highlight-background))))
   `(region ((,class (:extend t :background ,nordic-night-dark0))))
   `(scroll-bar ((,class (:background ,nordic-night-dark3))))
   `(secondary-selection ((,class (:background ,nordic-night-dark2))))

   ;; `show-paren-match-face` and `show-paren-mismatch-face` are deprecated since Emacs version 22.1 and were
   ;; removed in Emacs 25.
   ;; https://github.com/nordic-nighttheme/emacs/issues/75
   ;; http://git.savannah.gnu.org/cgit/emacs.git/commit/?id=c430f7e23fc2c22f251ace4254e37dea1452dfc3
   ;; https://github.com/emacs-mirror/emacs/commit/c430f7e23fc2c22f251ace4254e37dea1452dfc3
   `(show-paren-match-face ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-brightblue8))))
   `(show-paren-mismatch-face ((,class (:background ,nordic-night-red11))))

   `(show-paren-match ((,class (:background ,nordic-night-dark0))))
   `(show-paren-mismatch ((,class (:background ,nordic-night-red11))))
   `(success ((,class (:foreground ,nordic-night-green14))))
   `(tab-bar ((t (:background ,nordic-night-dark0 :foreground ,nordic-night-snowy4 :box nil))))
   `(tab-bar-tab ((t (:inherit tab-bar :background ,nordic-night-dark0))))
   `(tab-bar-tab-inactive ((t (:foreground ,nordic-night-dark3))))
   `(term ((,class (:foreground ,nordic-night-snowy4 :background ,nordic-night-dark0))))
   `(term-color-black ((,class (:foreground ,nordic-night-dark1 :background ,nordic-night-dark1))))
   `(term-color-white ((,class (:foreground ,nordic-night-snowy5 :background ,nordic-night-snowy5))))
   `(term-color-cyan ((,class (:foreground ,nordic-night-bluegreen7 :background ,nordic-night-bluegreen7))))
   `(term-color-blue ((,class (:foreground ,nordic-night-brightblue8 :background ,nordic-night-brightblue8))))
   `(term-color-red ((,class (:foreground ,nordic-night-red11 :background ,nordic-night-red11))))
   `(term-color-yellow ((,class (:foreground ,nordic-night-yellow13 :background ,nordic-night-yellow13))))
   `(term-color-green ((,class (:foreground ,nordic-night-green14 :background ,nordic-night-green14))))
   `(term-color-magenta ((,class (:foreground ,nordic-night-purple15 :background ,nordic-night-purple15))))
   `(tool-bar ((,class (:foreground ,nordic-night-snowy4 :background ,nordic-night-dark3))))
   `(tooltip ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-snowy4))))
   `(trailing-whitespace ((,class (:foreground ,nordic-night-dark3))))
   `(tty-menu-disabled-face ((,class (:foreground ,nordic-night-dark1))))
   `(tty-menu-enabled-face ((,class (:background ,nordic-night-dark2 foreground ,nordic-night-snowy4))))
   `(tty-menu-selected-face ((,class (:foreground ,nordic-night-brightblue8 :underline t))))
   `(undo-tree-visualizer-current-face ((,class (:foreground ,nordic-night-brightblue8))))
   `(undo-tree-visualizer-default-face ((,class (:foreground ,nordic-night-snowy4))))
   `(undo-tree-visualizer-unmodified-face ((,class (:foreground ,nordic-night-snowy4))))
   `(undo-tree-visualizer-register-face ((,class (:foreground ,nordic-night-lapis9))))
   `(vc-conflict-state ((,class (:foreground ,nordic-night-orange12))))
   `(vc-edited-state ((,class (:foreground ,nordic-night-yellow13))))
   `(vc-locally-added-state ((,class (:underline ,nordic-night-green14))))
   `(vc-locked-state ((,class (:foreground ,nordic-night-blue10))))
   `(vc-missing-state ((,class (:foreground ,nordic-night-red11))))
   `(vc-needs-update-state ((,class (:foreground ,nordic-night-orange12))))
   `(vc-removed-state ((,class (:foreground ,nordic-night-red11))))
   `(vc-state-base ((,class (:foreground ,nordic-night-snowy4))))
   `(vc-up-to-date-state ((,class (:foreground ,nordic-night-brightblue8))))
   `(vertical-border ((,class (:foreground ,nordic-night-dark2))))
   `(which-func ((,class (:foreground ,nordic-night-brightblue8))))
   `(whitespace-big-indent ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-dark0))))
   `(whitespace-empty ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-dark0))))
   `(whitespace-hspace ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-dark0))))
   `(whitespace-indentation ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-dark0))))
   `(whitespace-line ((,class (:background ,nordic-night-dark0))))
   `(whitespace-newline ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-dark0))))
   `(whitespace-space ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-dark0))))
   `(whitespace-space-after-tab ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-dark0))))
   `(whitespace-space-before-tab ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-dark0))))
   `(whitespace-tab ((,class (:foreground ,nordic-night-dark3 :background ,nordic-night-dark0))))
   `(whitespace-trailing ((,class (:inherit trailing-whitespace))))
   `(widget-button-pressed ((,class (:foreground ,nordic-night-lapis9 :background ,nordic-night-dark1))))
   `(widget-documentation ((,class (:foreground ,nordic-night-snowy4))))
   `(widget-field ((,class (:background ,nordic-night-dark2 :foreground ,nordic-night-snowy4))))
   `(widget-single-line-field ((,class (:background ,nordic-night-dark2 :foreground ,nordic-night-snowy4))))
   `(window-divider ((,class (:background ,nordic-night-dark3))))
   `(window-divider-first-pixel ((,class (:background ,nordic-night-dark3))))
   `(window-divider-last-pixel ((,class (:background ,nordic-night-dark3))))

    ;;;; +-----------------+
    ;;;; + Package Support +
    ;;;; +-----------------+
   ;; +--- Syntax ---+
   ;; > Auctex
   `(font-latex-bold-face ((,class (:inherit bold))))
   `(font-latex-italic-face ((,class (:inherit italic))))
   `(font-latex-math-face ((,class (:foreground ,nordic-night-brightblue8))))
   `(font-latex-sectioning-0-face ((,class (:foreground ,nordic-night-brightblue8 :weight bold))))
   `(font-latex-sectioning-1-face ((,class (:inherit font-latex-sectioning-0-face))))
   `(font-latex-sectioning-2-face ((,class (:inherit font-latex-sectioning-0-face))))
   `(font-latex-sectioning-3-face ((,class (:inherit font-latex-sectioning-0-face))))
   `(font-latex-sectioning-4-face ((,class (:inherit font-latex-sectioning-0-face))))
   `(font-latex-sectioning-5-face ((,class (:inherit font-latex-sectioning-0-face))))
   `(font-latex-script-char-face ((,class (:inherit font-lock-warning-face))))
   `(font-latex-string-face ((,class (:inherit font-lock-string-face))))
   `(font-latex-warning-face ((,class (:inherit font-lock-warning-face))))

   ;; > Elixir
   `(elixir-attribute-face ((,class (:foreground ,nordic-night-annotation))))
   `(elixir-atom-face ((,class (:foreground ,nordic-night-lapis9))))

   ;; > Enhanced Ruby
   `(enh-ruby-heredoc-delimiter-face ((,class (:foreground ,nordic-night-green14))))
   `(enh-ruby-op-face ((,class (:foreground ,nordic-night-lapis9))))
   `(enh-ruby-regexp-delimiter-face ((,class (:foreground ,nordic-night-yellow13))))
   `(enh-ruby-regexp-face ((,class (:foreground ,nordic-night-yellow13))))
   `(enh-ruby-string-delimiter-face ((,class (:foreground ,nordic-night-green14))))
   `(erm-syn-errline ((,class (:foreground ,nordic-night-red11 :underline t))))
   `(erm-syn-warnline ((,class (:foreground ,nordic-night-yellow13 :underline t))))

   ;; > Java Development Environment for Emacs
   `(jdee-db-active-breakpoint-face ((,class (:background ,nordic-night-dark2 :weight bold))))
   `(jdee-bug-breakpoint-cursor ((,class (:background ,nordic-night-dark2))))
   `(jdee-db-requested-breakpoint-face ((,class (:foreground ,nordic-night-yellow13 :background ,nordic-night-dark2 :weight bold))))
   `(jdee-db-spec-breakpoint-face ((,class (:foreground ,nordic-night-green14 :background ,nordic-night-dark2 :weight bold))))
   `(jdee-font-lock-api-face ((,class (:foreground ,nordic-night-snowy4))))
   `(jdee-font-lock-code-face ((,class (:slant italic))))
   `(jdee-font-lock-constant-face ((,class (:foreground ,nordic-night-keyword))))
   `(jdee-font-lock-constructor-face ((,class (:foreground ,nordic-night-method))))
   `(jdee-font-lock-doc-tag-face ((,class (:foreground ,nordic-night-bluegreen7))))
   `(jdee-font-lock-link-face ((,class (:underline t))))
   `(jdee-font-lock-modifier-face ((,class (:foreground ,nordic-night-keyword))))
   `(jdee-font-lock-number-face ((,class (:foreground ,nordic-night-numeric))))
   `(jdee-font-lock-operator-fac ((,class (:foreground ,nordic-night-operator))))
   `(jdee-font-lock-package-face ((,class (:foreground ,nordic-night-class))))
   `(jdee-font-lock-pre-face ((,class (:foreground ,nordic-night-comment :slant italic))))
   `(jdee-font-lock-private-face ((,class (:foreground ,nordic-night-keyword))))
   `(jdee-font-lock-public-face ((,class (:foreground ,nordic-night-keyword))))
   `(jdee-font-lock-variable-face ((,class (:foreground ,nordic-night-variable))))

   ;; > JavaScript 2
   `(js2-function-call ((,class (:foreground ,nordic-night-brightblue8))))
   `(js2-private-function-call ((,class (:foreground ,nordic-night-brightblue8))))
   `(js2-jsdoc-html-tag-delimiter ((,class (:foreground ,nordic-night-snowy6))))
   `(js2-jsdoc-html-tag-name ((,class (:foreground ,nordic-night-lapis9))))
   `(js2-external-variable ((,class (:foreground ,nordic-night-snowy4))))
   `(js2-function-param ((,class (:foreground ,nordic-night-snowy4))))
   `(js2-jsdoc-value ((,class (:foreground ,nordic-night-comment))))
   `(js2-jsdoc-tag ((,class (:foreground ,nordic-night-bluegreen7))))
   `(js2-jsdoc-type ((,class (:foreground ,nordic-night-bluegreen7))))
   `(js2-private-member ((,class (:foreground ,nordic-night-snowy4))))
   `(js2-object-property ((,class (:foreground ,nordic-night-snowy4))))
   `(js2-error ((,class (:foreground ,nordic-night-red11))))
   `(js2-warning ((,class (:foreground ,nordic-night-yellow13))))
   `(js2-instance-member ((,class (:foreground ,nordic-night-snowy4))))

   ;; > JavaScript 3
   `(js3-error-face ((,class (:foreground ,nordic-night-red11))))
   `(js3-external-variable-face ((,class (:foreground ,nordic-night-snowy4))))
   `(js3-function-param-face ((,class (:foreground ,nordic-night-snowy4))))
   `(js3-instance-member-face ((,class (:foreground ,nordic-night-snowy4))))
   `(js3-jsdoc-html-tag-delimiter-face ((,class (:foreground ,nordic-night-snowy6))))
   `(js3-jsdoc-html-tag-name-face ((,class (:foreground ,nordic-night-lapis9))))
   `(js3-jsdoc-tag-face ((,class (:foreground ,nordic-night-lapis9))))
   `(js3-jsdoc-type-face ((,class (:foreground ,nordic-night-bluegreen7))))
   `(js3-jsdoc-value-face ((,class (:foreground ,nordic-night-snowy4))))
   `(js3-magic-paren-face ((,class (:inherit show-paren-match-face))))
   `(js3-private-function-call-face ((,class (:foreground ,nordic-night-brightblue8))))
   `(js3-private-member-face ((,class (:foreground ,nordic-night-snowy4))))
   `(js3-warning-face ((,class (:foreground ,nordic-night-yellow13))))

   ;; > Markdown
   `(markdown-blockquote-face ((,class (:foreground ,nordic-night-comment))))
   `(markdown-bold-face ((,class (:inherit bold))))
   `(markdown-header-face-1 ((,class (:inherit org-level-1))))
   `(markdown-header-face-2 ((,class (:inherit org-level-2))))
   `(markdown-header-face-3 ((,class (:inherit org-level-3))))
   `(markdown-header-face-4 ((,class (:inherit org-level-4))))
   `(markdown-header-face-5 ((,class (:inherit org-level-5))))
   `(markdown-header-face-6 ((,class (:inherit org-level-6))))
   `(markdown-inline-code-face ((,class (:foreground ,nordic-night-bluegreen7))))
   `(markdown-italic-face ((,class (:inherit italic))))
   `(markdown-link-face ((,class (:foreground ,nordic-night-brightblue8))))
   `(markdown-markup-face ((,class (:foreground ,nordic-night-lapis9))))
   `(markdown-reference-face ((,class (:inherit markdown-link-face))))
   `(markdown-url-face ((,class (:foreground ,nordic-night-snowy4 :underline t))))

   ;; > Rainbow Delimeters
   `(rainbow-delimiters-depth-1-face ((,class :foreground ,nordic-night-bluegreen7)))
   `(rainbow-delimiters-depth-2-face ((,class :foreground ,nordic-night-brightblue8)))
   `(rainbow-delimiters-depth-3-face ((,class :foreground ,nordic-night-lapis9)))
   `(rainbow-delimiters-depth-4-face ((,class :foreground ,nordic-night-blue10)))
   `(rainbow-delimiters-depth-5-face ((,class :foreground ,nordic-night-orange12)))
   `(rainbow-delimiters-depth-6-face ((,class :foreground ,nordic-night-yellow13)))
   `(rainbow-delimiters-depth-7-face ((,class :foreground ,nordic-night-green14)))
   `(rainbow-delimiters-depth-8-face ((,class :foreground ,nordic-night-purple15)))
   `(rainbow-delimiters-unmatched-face ((,class :foreground ,nordic-night-red11)))

   ;; > Web Mode
   `(web-mode-attr-tag-custom-face ((,class (:foreground ,nordic-night-attribute))))
   `(web-mode-builtin-face ((,class (:foreground ,nordic-night-keyword))))
   `(web-mode-comment-face ((,class (:foreground ,nordic-night-comment))))
   `(web-mode-comment-keyword-face ((,class (:foreground ,nordic-night-comment))))
   `(web-mode-constant-face ((,class (:foreground ,nordic-night-variable))))
   `(web-mode-css-at-rule-face ((,class (:foreground ,nordic-night-annotation))))
   `(web-mode-css-function-face ((,class (:foreground ,nordic-night-method))))
   `(web-mode-css-property-name-face ((,class (:foreground ,nordic-night-keyword))))
   `(web-mode-css-pseudo-class-face ((,class (:foreground ,nordic-night-class))))
   `(web-mode-css-selector-face ((,class (:foreground ,nordic-night-keyword))))
   `(web-mode-css-string-face ((,class (:foreground ,nordic-night-string))))
   `(web-mode-doctype-face ((,class (:foreground ,nordic-night-preprocessor))))
   `(web-mode-function-call-face ((,class (:foreground ,nordic-night-method))))
   `(web-mode-function-name-face ((,class (:foreground ,nordic-night-method))))
   `(web-mode-html-attr-name-face ((,class (:foreground ,nordic-night-attribute))))
   `(web-mode-html-attr-equal-face ((,class (:foreground ,nordic-night-punctuation))))
   `(web-mode-html-attr-value-face ((,class (:foreground ,nordic-night-string))))
   `(web-mode-html-entity-face ((,class (:foreground ,nordic-night-keyword))))
   `(web-mode-html-tag-bracket-face ((,class (:foreground ,nordic-night-punctuation))))
   `(web-mode-html-tag-custom-face ((,class (:foreground ,nordic-night-tag))))
   `(web-mode-html-tag-face ((,class (:foreground ,nordic-night-tag))))
   `(web-mode-html-tag-namespaced-face ((,class (:foreground ,nordic-night-keyword))))
   `(web-mode-json-key-face ((,class (:foreground ,nordic-night-class))))
   `(web-mode-json-string-face ((,class (:foreground ,nordic-night-string))))
   `(web-mode-keyword-face ((,class (:foreground ,nordic-night-keyword))))
   `(web-mode-preprocessor-face ((,class (:foreground ,nordic-night-preprocessor))))
   `(web-mode-string-face ((,class (:foreground ,nordic-night-string))))
   `(web-mode-symbol-face ((,class (:foreground ,nordic-night-variable))))
   `(web-mode-type-face ((,class (:foreground ,nordic-night-class))))
   `(web-mode-warning-face ((,class (:inherit ,font-lock-warning-face))))
   `(web-mode-variable-name-face ((,class (:foreground ,nordic-night-variable))))

   ;; > Racket
   `(racket-xp-unused-face ((,class (:strike-through nil :underline (:color ,nordic-night-yellow13 :style wave)))))

   ;; +--- UI ---+
   ;; > Anzu
   `(anzu-mode-line ((,class (:foreground, nordic-night-brightblue8))))
   `(anzu-mode-line-no-match ((,class (:foreground, nordic-night-red11))))

   ;; > Avy
   `(avy-lead-face ((,class (:background ,nordic-night-red11 :foreground ,nordic-night-snowy5))))
   `(avy-lead-face-0 ((,class (:background ,nordic-night-blue10 :foreground ,nordic-night-snowy5))))
   `(avy-lead-face-1 ((,class (:background ,nordic-night-dark3 :foreground ,nordic-night-snowy5))))
   `(avy-lead-face-2 ((,class (:background ,nordic-night-purple15 :foreground ,nordic-night-snowy5))))

   ;; > Blamer
   `(blamer-face ((,class (:italic t :foreground ,nordic-night-dark1))))

   ;; > Company
   `(company-echo-common ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-snowy4))))
   `(company-preview ((,class (:foreground ,nordic-night-snowy4 :background ,nordic-night-blue10))))
   `(company-preview-common ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-brightblue8))))
   `(company-preview-search ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-brightblue8))))
   `(company-scrollbar-bg ((,class (:foreground ,nordic-night-dark1 :background ,nordic-night-dark1))))
   `(company-scrollbar-fg ((,class (:foreground ,nordic-night-dark2 :background ,nordic-night-dark2))))
   `(company-template-field ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-bluegreen7))))
   `(company-tooltip ((,class (:foreground ,nordic-night-snowy4 :background ,nordic-night-dark2))))
   `(company-tooltip-annotation ((,class (:foreground ,nordic-night-orange12))))
   `(company-tooltip-annotation-selection ((,class (:foreground ,nordic-night-orange12 :weight bold))))
   `(company-tooltip-common ((,class (:foreground ,nordic-night-brightblue8))))
   `(company-tooltip-common-selection ((,class (:foreground ,nordic-night-brightblue8 :background ,nordic-night-dark3))))
   `(company-tooltip-mouse ((,class (:inherit highlight))))
   `(company-tooltip-selection ((,class (:background ,nordic-night-dark3 :weight bold))))

   ;; > Corfu
   `(corfu-border ((,class (:background ,nordic-night-dark1))))
   `(corfu-default ((,class (:background ,nordic-night-lighterblack))))

   ;; > diff-hl
   `(diff-hl-change ((,class (:background ,nordic-night-yellow13))))
   `(diff-hl-insert ((,class (:background ,nordic-night-green14))))
   `(diff-hl-delete ((,class (:background ,nordic-night-red11))))

   ;; > Eglot
   `(eglot-highlight-symbol-face ((,class (:background ,nordic-night-dark3))))

   ;; > Evil
   `(evil-ex-info ((,class (:foreground ,nordic-night-brightblue8))))
   `(evil-ex-substitute-replacement ((,class (:foreground ,nordic-night-lapis9))))
   `(evil-ex-substitute-matches ((,class (:inherit isearch))))

   ;; > Flycheck
   `(flycheck-error ((,class (:underline (:style wave :color ,nordic-night-red11)))))
   `(flycheck-fringe-error ((,class (:foreground ,nordic-night-red11 :weight bold))))
   `(flycheck-fringe-info ((,class (:foreground ,nordic-night-brightblue8 :weight bold))))
   `(flycheck-fringe-warning ((,class (:foreground ,nordic-night-yellow13 :weight bold))))
   `(flycheck-info ((,class (:underline (:style wave :color ,nordic-night-brightblue8)))))
   `(flycheck-warning ((,class (:underline (:style wave :color ,nordic-night-yellow13)))))

   ;; > Git Gutter
   `(git-gutter:modified ((,class (:foreground ,nordic-night-yellow13))))
   `(git-gutter:added ((,class (:foreground ,nordic-night-green14))))
   `(git-gutter:deleted ((,class (:foreground ,nordic-night-red11))))

   ;; > Git Gutter Plus
   `(git-gutter+-modified ((,class (:foreground ,nordic-night-yellow13))))
   `(git-gutter+-added ((,class (:foreground ,nordic-night-green14))))
   `(git-gutter+-deleted ((,class (:foreground ,nordic-night-red11))))

   ;; > Helm
   `(helm-bookmark-addressbook ((,class (:foreground ,nordic-night-bluegreen7))))
   `(helm-bookmark-directory ((,class (:foreground ,nordic-night-lapis9))))
   `(helm-bookmark-file ((,class (:foreground ,nordic-night-brightblue8))))
   `(helm-bookmark-gnus ((,class (:foreground ,nordic-night-blue10))))
   `(helm-bookmark-info ((,class (:foreground ,nordic-night-green14))))
   `(helm-bookmark-man ((,class (:foreground ,nordic-night-snowy4))))
   `(helm-bookmark-w3m ((,class (:foreground ,nordic-night-lapis9))))
   `(helm-buffer-directory ((,class (:foreground ,nordic-night-lapis9))))
   `(helm-buffer-file ((,class (:foreground ,nordic-night-brightblue8))))
   `(helm-buffer-not-saved ((,class (:foreground ,nordic-night-yellow13))))
   `(helm-buffer-process ((,class (:foreground ,nordic-night-blue10))))
   `(helm-candidate-number ((,class (:foreground ,nordic-night-snowy4 :weight bold))))
   `(helm-candidate-number-suspended ((,class (:foreground ,nordic-night-snowy4))))
   `(helm-ff-directory ((,class (:foreground ,nordic-night-lapis9 :weight bold))))
   `(helm-ff-dirs ((,class (:foreground ,nordic-night-lapis9))))
   `(helm-ff-dotted-director ((,class (:foreground ,nordic-night-lapis9 :underline t))))
   `(helm-ff-dotted-symlink-director ((,class (:foreground ,nordic-night-bluegreen7 :weight bold))))
   `(helm-ff-executable ((,class (:foreground ,nordic-night-brightblue8))))
   `(helm-ff-file ((,class (:foreground ,nordic-night-snowy4))))
   `(helm-ff-invalid-symlink ((,class (:foreground ,nordic-night-red11 :weight bold))))
   `(helm-ff-prefix ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-lapis9))))
   `(helm-ff-symlink ((,class (:foreground ,nordic-night-bluegreen7))))
   `(helm-grep-cmd-line ((,class (:foreground ,nordic-night-snowy4 :background ,nordic-night-dark0))))
   `(helm-grep-file ((,class (:foreground ,nordic-night-brightblue8))))
   `(helm-grep-finish ((,class (:foreground ,nordic-night-snowy5))))
   `(helm-grep-lineno ((,class (:foreground ,nordic-night-snowy4))))
   `(helm-grep-match ((,class (:inherit isearch))))
   `(helm-grep-running ((,class (:foreground ,nordic-night-brightblue8))))
   `(helm-header ((,class (:foreground ,nordic-night-lapis9 :background ,nordic-night-dark2))))
   `(helm-header-line-left-margin ((,class (:foreground ,nordic-night-lapis9 :background ,nordic-night-dark2))))
   `(helm-history-deleted ((,class (:foreground ,nordic-night-red11))))
   `(helm-history-remote ((,class (:foreground ,nordic-night-snowy4))))
   `(helm-lisp-completion-info ((,class (:foreground ,nordic-night-snowy4 :weight bold))))
   `(helm-lisp-show-completion ((,class (:inherit isearch))))
   `(helm-locate-finish ((,class (:foreground ,nordic-night-green14))))
   `(helm-match ((,class (:foreground ,nordic-night-brightblue8))))
   `(helm-match-item ((,class (:inherit isearch))))
   `(helm-moccur-buffer ((,class (:foreground ,nordic-night-brightblue8))))
   `(helm-resume-need-update ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-yellow13))))
   `(helm-selection ((,class (:inherit highlight))))
   `(helm-selection-line ((,class (:background ,nordic-night-dark2))))
   `(helm-source-header ((,class (:height 1.44 :foreground ,nordic-night-brightblue8 :background ,nordic-night-dark2))))
   `(helm-swoop-line-number-face ((,class (:foreground ,nordic-night-snowy4 :background ,nordic-night-dark0))))
   `(helm-swoop-target-word-face ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-bluegreen7))))
   `(helm-swoop-target-line-face ((,class (:background ,nordic-night-yellow13 :foreground ,nordic-night-dark3))))
   `(helm-swoop-target-line-block-face ((,class (:background ,nordic-night-yellow13 :foreground ,nordic-night-dark3))))
   `(helm-separator ((,class (:background ,nordic-night-dark2))))
   `(helm-visible-mark ((,class (:background ,nordic-night-dark2))))

   ;; > Magit
   `(magit-branch ((,class (:foreground ,nordic-night-bluegreen7 :weight bold))))
   `(magit-diff-context-highlight ((,class (:background ,nordic-night-dark2))))
   `(magit-diff-file-header ((,class (:foreground ,nordic-night-brightblue8 :box (:color ,nordic-night-brightblue8)))))
   `(magit-diffstat-added ((,class (:foreground ,nordic-night-green14))))
   `(magit-diffstat-removed ((,class (:foreground ,nordic-night-red11))))
   `(magit-hash ((,class (:foreground ,nordic-night-brightblue8))))
   `(magit-hunk-heading ((,class (:foreground ,nordic-night-lapis9))))
   `(magit-hunk-heading-highlight ((,class (:foreground ,nordic-night-lapis9 :background ,nordic-night-dark2))))
   `(magit-item-highlight ((,class (:foreground ,nordic-night-brightblue8 :background ,nordic-night-dark2))))
   `(magit-log-author ((,class (:foreground ,nordic-night-bluegreen7))))
   `(magit-process-ng ((,class (:foreground ,nordic-night-yellow13 :weight bold))))
   `(magit-process-ok ((,class (:foreground ,nordic-night-green14 :weight bold))))
   `(magit-section-heading ((,class (:foreground ,nordic-night-bluegreen7 :weight bold))))
   `(magit-section-highlight ((,class (:background ,nordic-night-lighterblack))))

   ;; > MU4E
   `(mu4e-header-marks-face ((,class (:foreground ,nordic-night-lapis9))))
   `(mu4e-title-face ((,class (:foreground ,nordic-night-brightblue8))))
   `(mu4e-header-key-face ((,class (:foreground ,nordic-night-brightblue8))))
   `(mu4e-highlight-face ((,class (:highlight))))
   `(mu4e-flagged-face ((,class (:foreground ,nordic-night-yellow13))))
   `(mu4e-unread-face ((,class (:foreground ,nordic-night-yellow13 :weight bold))))
   `(mu4e-link-face ((,class (:underline t))))

   ;; > Powerline
   `(powerline-active1 ((,class (:foreground ,nordic-night-snowy4 :background ,nordic-night-dark1))))
   `(powerline-active2 ((,class (:foreground ,nordic-night-snowy4 :background ,nordic-night-dark3))))
   `(powerline-inactive1 ((,class (:background ,nordic-night-dark2))))
   `(powerline-inactive2 ((,class (:background ,nordic-night-dark2))))

   ;; > Powerline Evil
   `(powerline-evil-base-face ((,class (:foreground ,nordic-night-snowy4))))
   `(powerline-evil-normal-face ((,class (:background ,nordic-night-brightblue8))))
   `(powerline-evil-insert-face ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-snowy4))))
   `(powerline-evil-visual-face ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-bluegreen7))))
   `(powerline-evil-replace-face ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-lapis9))))

   ;; > NeoTree
   `(neo-banner-face ((,class (:foreground ,nordic-night-blue10))))
   `(neo-dir-link-face ((,class (:foreground ,nordic-night-lapis9))))
   `(neo-expand-btn-face ((,class (:foreground ,nordic-night-snowy6 :bold t))))
   `(neo-file-link-face ((,class (:foreground ,nordic-night-snowy4))))
   `(neo-root-dir-face ((,class (:foreground ,nordic-night-bluegreen7 :weight bold))))
   `(neo-vc-added-face ((,class (:foreground ,nordic-night-green14))))
   `(neo-vc-conflict-face ((,class (:foreground ,nordic-night-red11))))
   `(neo-vc-default-face ((,class (:foreground ,nordic-night-snowy4))))
   `(neo-vc-edited-face ((,class (:foreground ,nordic-night-yellow13))))
   `(neo-vc-ignored-face ((,class (:foreground ,nordic-night-dark3))))
   `(neo-vc-missing-face ((,class (:foreground ,nordic-night-orange12))))
   `(neo-vc-needs-merge-face ((,class (:background ,nordic-night-orange12 :foreground ,nordic-night-snowy4))))
   `(neo-vc-needs-update-face ((,class (:background ,nordic-night-blue10 :foreground ,nordic-night-snowy4))))
   `(neo-vc-removed-face ((,class (:foreground ,nordic-night-red11 :strike-through nil))))
   `(neo-vc-up-to-date-face ((,class (:foreground ,nordic-night-snowy4))))
   `(neo-vc-user-face ((,class (:foreground ,nordic-night-snowy4))))

   ;; > Cider
   `(cider-result-overlay-face ((t (:background unspecified))))

   ;; > Org
   `(org-level-1 ((,class (:foreground ,nordic-night-brightblue8 :weight extra-bold))))
   `(org-level-2 ((,class (:foreground ,nordic-night-lapis9 :weight bold))))
   `(org-level-3 ((,class (:foreground ,nordic-night-blue10 :weight semi-bold))))
   `(org-level-4 ((,class (:foreground ,nordic-night-bluegreen7 :weight normal))))
   `(org-level-5 ((,class (:inherit org-level-4))))
   `(org-level-6 ((,class (:inherit org-level-4))))
   `(org-level-7 ((,class (:inherit org-level-4))))
   `(org-level-8 ((,class (:inherit org-level-4))))
   `(org-agenda-clocking ((,class (:box ,nordic-night-purple15))))
   `(org-agenda-date ((,class (:foreground ,nordic-night-brightblue8 :underline t))))
   `(org-agenda-date-today ((,class (:foreground ,nordic-night-blue10 :weight bold :inverse-video t :underline nil :extend t))))
   `(org-agenda-date-weekend ((,class (:foreground ,nordic-night-lapis9))))
   `(org-agenda-dimmed-todo-face ((,class (:background ,nordic-night-yellow13))))
   `(org-agenda-done ((,class (:foreground ,nordic-night-lessdark3-2 :weight light :slant italic))))
   `(org-agenda-structure ((,class (:foreground ,nordic-night-lapis9))))
   `(org-block ((,class (:foreground ,nordic-night-snowy4))))
   `(org-block-background ((,class (:background ,nordic-night-dark0))))
   `(org-block-begin-line ((,class (:foreground ,nordic-night-bluegreen7))))
   `(org-block-end-line ((,class (:foreground ,nordic-night-bluegreen7))))
   `(org-checkbox ((,class (:foreground ,nordic-night-lapis9))))
   `(org-checkbox-statistics-done ((,class (:foreground ,nordic-night-green14))))
   `(org-checkbox-statistics-todo ((,class (:foreground ,nordic-night-yellow13))))
   `(org-code ((,class (:foreground ,nordic-night-green14))))
   `(org-column ((,class (:background ,nordic-night-dark2))))
   `(org-column-title ((,class (:inherit org-column :weight bold :underline t))))
   `(org-date ((,class (:foreground ,nordic-night-brightblue8))))
   `(org-document-info ((,class (:foreground ,nordic-night-snowy4))))
   `(org-document-info-keyword ((,class (:foreground ,nordic-night-dark3 :weight bold))))
   `(org-document-title ((,class (:foreground ,nordic-night-brightblue8 :weight bold))))
   `(org-done ((,class (:foreground ,nordic-night-green14 :weight bold))))
   `(org-ellipsis ((,class (:foreground ,nordic-night-dark3))))
   `(org-footnote ((,class (:foreground ,nordic-night-brightblue8))))
   `(org-formula ((,class (:foreground ,nordic-night-lapis9))))
   `(org-headline-done ((,class (:foreground ,nordic-night-lessdark3-1))))
   `(org-hide ((,class (:foreground ,nordic-night-dark0 :background ,nordic-night-dark0))))
   `(org-link ((,class (:underline ,nordic-night-brightblue8))))
   `(org-priority ((,class (:foreground ,nordic-night-purple15))))
   `(org-quote ((,class (:inherit org-block :slant italic :foreground ,nordic-night-green14))))
   `(org-scheduled ((,class (:foreground ,nordic-night-green14))))
   `(org-scheduled-previously ((,class (:foreground ,nordic-night-orange12))))
   `(org-scheduled-today ((,class (:foreground ,nordic-night-yellow13))))
   `(org-special-keyword ((,class (:foreground ,nordic-night-lapis9))))
   `(org-table ((,class (:foreground ,nordic-night-lapis9))))
   `(org-todo ((,class (:foreground ,nordic-night-orange12 :weight bold))))
   `(org-upcoming-deadline ((,class (:foreground ,nordic-night-snowy4))))
   `(org-upcoming-distant-deadline ((,class (:foreground ,nordic-night-lessdark3-1))))
   `(org-verbatim ((,class (:foreground ,nordic-night-bluegreen7))))
   `(org-verse ((,class (:inherit org-block :slant italic))))
   `(org-warning ((,class (:foreground ,nordic-night-red11 :weight bold))))

   `(font-latex-bold-face ((,class (:inherit bold))))
   `(font-latex-italic-face ((,class (:slant italic))))
   `(font-latex-string-face ((,class (:foreground ,nordic-night-green14))))
   `(font-latex-match-reference-keywords ((,class (:foreground ,nordic-night-lapis9))))
   `(font-latex-match-variable-keywords ((,class (:foreground ,nordic-night-snowy4))))
   `(ido-only-match ((,class (:foreground ,nordic-night-brightblue8))))
   `(org-sexp-date ((,class (:foreground ,nordic-night-bluegreen7))))
   `(ido-first-match ((,class (:foreground ,nordic-night-brightblue8 :weight bold))))
   `(ido-subdir ((,class (:foreground ,nordic-night-lapis9))))

   ;; > ivy-mode
   `(ivy-current-match ((,class (:inherit region))))
   `(ivy-minibuffer-match-face-1 ((,class (:inherit default))))
   `(ivy-minibuffer-match-face-2 ((,class (:background ,nordic-night-bluegreen7 :foreground ,nordic-night-dark0))))
   `(ivy-minibuffer-match-face-3 ((,class (:background ,nordic-night-brightblue8 :foreground ,nordic-night-dark0))))
   `(ivy-minibuffer-match-face-4 ((,class (:background ,nordic-night-lapis9 :foreground ,nordic-night-dark0))))
   `(ivy-remote ((,class (:foreground ,nordic-night-green14))))
   `(ivy-posframe ((,class (:background ,nordic-night-dark1))))
   `(ivy-posframe-border ((,class (:background ,nordic-night-dark1))))
   `(ivy-remote ((,class (:foreground ,nordic-night-green14))))

   ;; > perspective
   `(persp-selected-face ((,class (:foreground ,nordic-night-brightblue8 :weight bold))))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'nordic-night)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; nordic-night-theme.el ends here
