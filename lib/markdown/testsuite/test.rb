module Markdown
  module Testsuite
    class Test
      
      attr_reader :md, :html
      
      def initialize(rule)
        begin
          @md   = File.read "specification/#{rule}.md"
          @html = File.read "specification/#{rule}.out"
        rescue Exception => e 
          raise Exception.new "Rule #{rule} not found - #{e}"
        end
      end
    end
  end
end