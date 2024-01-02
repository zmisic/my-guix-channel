(define-module (rust-names)
  #:use-module (guix packages)
  #:use-module (gnu packages crates-io)
  #:use-module (guix download)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-names-0.14
(package
  (name "rust-names")
  (version "0.14.0")
  (source
   (origin
     (method url-fetch)
     (uri (crate-uri "names" version))
     (file-name (string-append name "-" version ".tar.gz"))
     (sha256
      (base32 "1g1rxifcsvj9zj2nmwbdix8b5ynpghs4rq40vs966jqlylxwvpbv"))))
  (build-system cargo-build-system)
  (arguments
   `(#:cargo-inputs (("rust-clap" ,rust-clap-3)
                     ("rust-rand" ,rust-rand-0.8))
     #:cargo-development-inputs (("rust-version-sync" ,rust-version-sync-0.9))))
  (home-page "https://github.com/fnichol/names")
  (synopsis "A random name generator with names suitable for use in container stances, project names, application instances, etc.")
   (description  "This package provides a random name generator with names suitable for use in ntainer instances, project names, application instances, etc.")
  (license license:expat)))
