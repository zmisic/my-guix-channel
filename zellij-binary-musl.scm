(define-module (zellij-binary-musl)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system copy)
  #:use-module (guix download))

(define-public zellij-binary-musl
(package
  (name "zellij-binary-musl")
  (version "0.39.2")
  (source (origin
	    (method url-fetch)
	    (uri (string-append "https://github.com/zellij-org/zellij/releases/download/v" version "/zellij" "-x86_64-unknown-linux-musl.tar.gz"))
	    (sha256
	      (base32 "10aamb7vy3rccgqgnpwmyspn1yhjz1sy8lr77f54saq4hwldl0wj"))))
  (build-system copy-build-system)
  (supported-systems '("x86_64-linux" "i686-linux"))
  (arguments
    `(#:install-plan '(("zellij" "bin/zellij-binary-musl"))))
  (home-page "https://zellij.dev/")
  (synopsis "A terminal workspace with batteries included")
  (description "Zellij is a terminal workspace. It has the base functionality of a terminal multiplexer (similar to tmux or screen) but includes many built-in features that would allow users to extend it and create their own personalized environment..")
  (license gpl3+))
)
