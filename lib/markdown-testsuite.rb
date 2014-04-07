require "markdown/testsuite/version"

module Markdown
  module Testsuite
        
    # Public. Lists all core tests and extensions
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
    
    # Public. Creates a test object for comparison
    def self.test(rule, ext=nil)
      Markdown::Testsuite::Test.new rule, ext
    end
    
  end
end
