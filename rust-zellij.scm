(define-module (zellij-binary-musl)
  #:use-module (guix packages)
  #:use-module (guix build-system copy)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-zellij-0.39
  (package
    (name "rust-zellij")
    (version "0.39.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zellij" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19a18313c7k459yy99xxpk7xfbyrarq1grzah96ah05dccbsals4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-dialoguer" ,rust-dialoguer-0.10)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-names" ,rust-names-0.14)
                       ("rust-suggest" ,rust-suggest-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-zellij-client" ,rust-zellij-client-0.39)
                       ("rust-zellij-server" ,rust-zellij-server-0.39)
                       ("rust-zellij-utils" ,rust-zellij-utils-0.39))
       #:cargo-development-inputs (("rust-insta" ,rust-insta-1)
                                   ("rust-rand" ,rust-rand-0.8)
                                   ("rust-regex" ,rust-regex-1)
                                   ("rust-ssh2" ,rust-ssh2-0.9))))
    (home-page "https://zellij.dev")
    (synopsis "A terminal workspace with batteries included")
    (description
     "This package provides a terminal workspace with batteries included")
    (license license:expat)))


