require 'spec_helper'

describe Markdown::Testsuite do
  describe "Public API" do  
    it "lists core tests" do
      Markdown::Testsuite.must_respond_to :list
      Markdown::Testsuite.list.must_be_kind_of Array
      Markdown::Testsuite.list.include?('2-paragraphs-hard-return-spaces').must_equal true
      Markdown::Testsuite.list.include?('unordered-list-with-indented-content').must_equal true
    end
    
    it "lists extentions" do
      Markdown::Testsuite.list(:extensions).must_be_kind_of Array
      Markdown::Testsuite.list(:extensions).include?('kramdown').must_equal true
      Markdown::Testsuite.list(:extensions).include?('pandoc').must_equal true
    end
  end
end