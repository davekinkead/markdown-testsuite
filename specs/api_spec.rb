require 'spec_helper'

describe Markdown::Testsuite do
  describe "Public API" do
    it "lists core tests" do
      Markdown::Testsuite.must_respond_to :list
    end
  end
end