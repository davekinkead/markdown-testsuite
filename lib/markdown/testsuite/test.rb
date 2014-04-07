require 'markdown/testsuite/version'

module Markdown
  module Testsuite
    class Test
      
      attr_reader :md, :html
      
      def initialize(rule, ext=nil)
        path = ext.nil? ? "#{SPEC_PATH}/" : "#{SPEC_PATH}/extensions/#{ext.to_s}/"
        begin
          @md   = File.read "#{path}#{rule}.md"
          @html = File.read "#{path}#{rule}.out"
        rescue Exception => e 
          raise Exception.new "Rule #{rule} not found - #{e}"
        end
      end
    end
  end
end