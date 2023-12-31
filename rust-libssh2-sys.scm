(define-module (rust-libssh2-sys)
  #:use-module (guix packages)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages tls)
  #:use-module (guix download)
  #:use-module (guix build-system cargo)
  #:use-module (guix build utils)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-libssh2-sys-0.3.0
  (package
    (name "rust-libssh2-sys")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "libssh2-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1vkidqw5ll71ynqc93hgcq62iqkklzb5268zffd13ql7nwqa1j1d"))
        (modules '((guix build utils)))
        (snippet
         '(begin (delete-file-recursively "libssh2") #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-libz-sys" ,rust-libz-sys-1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ;; Build dependencies:
        ("rust-cc" ,rust-cc-1)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list libssh2 openssl zlib))
    (home-page "https://github.com/alexcrichton/ssh2-rs")
    (synopsis "Native bindings to the libssh2 library")
    (description
     "This package provides native rust bindings to the @code{libssh2} library.")
    (license (list license:asl2.0
                   license:expat)))
)
