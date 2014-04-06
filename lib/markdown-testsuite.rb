require "markdown/version"

module Markdown
  module Testsuite
    
    # Public. Lists all core tests and extensions
    def self.list(filter_by=:core)
      tests = []
      if filter_by == :extensions
        Dir.glob('specification/extensions/*').each do |file|
          if File.directory? file
            file[/specification\/extensions\/(.+?)$/]
            tests << $1
          end
        end        
      else
        Dir.glob('specification/*.md').each do |file|
          file[/specification\/(.+?).md/]
          tests << $1
        end
      end
      tests
    end
    
  end
end
