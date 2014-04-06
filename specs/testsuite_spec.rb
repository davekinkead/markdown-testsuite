require 'spec_helper'

describe Markdown::Testsuite do    
  
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
  
  it "returns a test for a specified rule" do
    @test = Markdown::Testsuite.test('unordered-list-with-indented-content')
    @test.must_be_kind_of Markdown::Testsuite::Test
    @test.md.must_equal File.read("specification/unordered-list-with-indented-content.md")
    @test.html.must_equal File.read("specification/unordered-list-with-indented-content.out")
  end
  
  it "raises an error if a rule does not exist" do
    ->{ Markdown::Testsuite.test('no-such-rule') }.must_raise Exception
  end
  
end