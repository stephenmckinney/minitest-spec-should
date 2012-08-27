# encoding: utf-8

require 'minitest/autorun'
require 'minitest/spec/should'

describe MiniTest::Spec do

  it "should have all original must/wont methods named should/should_not" do
    expected_musts = %w(must_be
                        must_be_close_to
                        must_be_empty
                        must_be_instance_of
                        must_be_kind_of
                        must_be_nil
                        must_be_same_as
                        must_be_silent
                        must_be_within_delta
                        must_be_within_epsilon
                        must_equal
                        must_include
                        must_match
                        must_output
                        must_raise
                        must_respond_to
                        must_send
                        must_throw)

    bad = %w[not raise throw send output be_silent]

    expected_wonts = expected_musts.map { |m| m.sub(/^must/, 'wont') }
    expected_wonts.reject! { |m| m =~ /wont_#{Regexp.union(*bad)}/ }
    expected_shoulds = expected_musts.map { |m| m.sub(/^must/, 'should') }
    expected_should_nots = expected_wonts.map { |m| m.sub(/^wont/, 'should_not') }

    methods = Object.public_instance_methods.find_all { |n| n =~ /^should|^should_not/ }
    methods.map! { |m| m.to_s } if Symbol === methods.first
    should_not_methods, should_methods = methods.sort.partition { |m| m =~ /^should_not/ }

    should_methods.should_equal expected_shoulds
    should_not_methods.should_equal expected_should_nots
  end

  it "should not have any must/wont methods" do
    methods = Object.public_instance_methods.find_all { |n| n =~ /^must|^wont/ }
    methods.map! { |m| m.to_s } if Symbol === methods.first

    methods.should_be_empty
  end

end
