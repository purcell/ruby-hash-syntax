[![Melpa Status](http://melpa.org/packages/ruby-hash-syntax-badge.svg)](http://melpa.org/#/ruby-hash-syntax)
[![Melpa Stable Status](http://stable.melpa.org/packages/ruby-hash-syntax-badge.svg)](http://stable.melpa.org/#/ruby-hash-syntax)
<a href="https://www.patreon.com/sanityinc"><img alt="Support me" src="https://img.shields.io/badge/Support%20Me-%F0%9F%92%97-ff69b4.svg"></a>

ruby-hash-syntax.el
===================

Adapted from the method used by TextMate, this library provides
a command `ruby-hash-syntax-toggle` which attempts to automatically
convert the selected region of ruby code between 1.8 and 1.9 hash styles.

Installation
=============

If you choose not to use one of the convenient packages in
[MELPA][melpa], you'll need to add the
directory containing `ruby-hash-syntax.el` to your `load-path`, and then
`(require 'ruby-hash-syntax)`.

Usage
=====

Add the following to your emacs init file:

    (require 'ruby-hash-syntax)

Then select a block of ruby code containing a hash literal (perhaps
using `mark-sexp`), and run the `ruby-hash-syntax-toggle` command:

    M-x ruby-hash-syntax-toggle

You might like to bind that command to a key in `ruby-mode-map`.

[melpa]: http://melpa.org

<hr>

[💝 Support this project and my other Open Source work](https://www.patreon.com/sanityinc)

[💼 LinkedIn profile](https://uk.linkedin.com/in/stevepurcell)

[✍ sanityinc.com](http://www.sanityinc.com/)
