# Markdown Test Suite

## The Ruby Fork

### Programatically test your markdown parser

Inspired by questions on [W3C Markdown Community Group](http://www.w3.org/community/markdown).

Pull Requests are welcome. To improve the `markdown-testsuite` rubygem, fork the ruby branch of this repo. See the [CONTRIBUTING Guidelines](https://github.com/karlcow/markdown-testsuite/blob/master/CONTRIBUTING.md) for additions to the markdown spec.

## Usage

First, install the gem and require it...

    require 'markdown-testsuite'

You can then list all the tests for the core spec...

    Markdown::Testsuite.list
    # => ["2-paragraphs-hard-return-spaces", "2-paragraphs-hard-return", ...]
    
Find out what extensions are supported...

    Markdown::Testsuite.list :extensions
    # => ["gfm", "kramdown", "multimarkdown", "pandoc", "redcarpet"]
    
Or list the tests for an extension...

    Markdown::Testsuite.list :kramdown
    # => ["fenced-code-block", "utf8"]
    
Then generate test objects for a rule, giving you access to its markdown and html form

    img = Markdown::Testsuite.test 'img-title'
    
    img.md
    # => "![HTML5](http://www.w3.org/html/logo/img/mark-word-icon.png \"HTML5 logo for everyone\")"
    
    img.html
    # => "<p><img src=\"http://www.w3.org/html/logo/img/mark-word-icon.png\" alt=\"HTML5\" title=\"HTML5 logo for everyone\" /></p>"