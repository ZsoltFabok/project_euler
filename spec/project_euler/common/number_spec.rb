require 'spec_helper'

describe Common::Number do
  context "#palindromic" do
    it "should return true for 9009" do
      Common::Number.is_palindromic?(9009).should be_true
    end

    it "should return false for 9008" do
      Common::Number.is_palindromic?(9008).should be_false
    end
  end
end