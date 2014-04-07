require "markdown/testsuite/version"

module Markdown
  module Testsuite
        
    # Public: Lists all available tests or extensions
    #
    # filter_by - The extension as a Symbol
    #
    # Examples
    #
    #   Markdown::Testsuite.list
    #   # => ["2-paragraphs-hard-return-spaces", "2-paragraphs-hard-return", ...]
    #
    #   Markdown::Testsuite.list :extensions
    #   # => ["gfm", "kramdown", "multimarkdown", "pandoc", "redcarpet"]
    #
    #   Markdown::Testsuite.list :kramdown
    #   # => ["fenced-code-block", "utf8"]
    #    
    # Returns the an Array.
    def self.list(filter_by=:core)
      tests = []
      
      if filter_by == :core
        Dir.glob("#{SPEC_PATH}/*.md").each do |file|
          file[/specification\/(.+?).md/]
          tests << $1
        end
      else
        extensions = Dir.glob("#{SPEC_PATH}/extensions/*").map do |file|
          if File.directory? file
            file[/specification\/extensions\/(.+?)$/]
            $1
          end
        end
        extensions.compact!.uniq!
        
        if filter_by == :extensions
          tests = extensions
        elsif
          Dir.glob("#{SPEC_PATH}/extensions/#{filter_by.to_s}/*.md").each do |file|
            file[/specification\/extensions\/#{filter_by.to_s}\/(.+?).md/]
            tests << $1
          end
        end
      end
      tests
    end
    
    # Public: Creates a test object for a rule
    #
    # rule - A String naming the rule
    # ext  - A Symbol naming the extension
    #
    # Examples
    #
    #   Markdown::Testsuite.test 'img-title'
    #   # => #<Markdown::Testsuite::Test:0x007fc633986240
    #
    #   Markdown::Testsuite.test 'uf8', :gfm
    #   # => #<Markdown::Testsuite::Test:0x007fc553986240
    #
    #    
    # Returns a Test object.
    def self.test(rule, ext=nil)
      Markdown::Testsuite::Test.new rule, ext
    end
    
  end
end
