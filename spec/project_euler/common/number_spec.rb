require 'spec_helper'

describe Common::Number do
  context "#palindromic" do
    subject(:number) {Common::Number.new}

    it "should return true for 9009" do
      number.is_palindromic?(9009).should be_true
    end

    it "should return false for 9008" do
      number.is_palindromic?(9008).should be_false
    end
  end
end