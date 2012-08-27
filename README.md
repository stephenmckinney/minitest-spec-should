# minitest/spec/should [![Build Status](https://secure.travis-ci.org/stephenmckinney/minitest-spec-should.png)](http://travis-ci.org/stephenmckinney/minitest-spec-should)

Support for traditional BDD syntax in MiniTest::Spec.

## Description

Replaces all `must/wont` methods with `should/should_not` methods in MiniTest::Spec.

To quote Dan North in [Introducting BDD](http://dannorth.net/introducing-bdd/):
> A more subtle aspect of the word *should* becomes apparent when compared with the more formal alternatives of *will* or *shall*. *Should* implicitly allows you to challenge the premise of the test: “Should it? Really?” This makes it easier to decide whether a test is failing due to a bug you have introduced or simply because your previous assumptions about the system’s behaviour are now incorrect.
 
## Installation

    gem install minitest-spec-should

In Gemfile:

    gem 'minitest-spec-should'

##Usage

    require 'minitest/autorun'
    require 'minitest/spec/should'

    describe Object do
      it "should respond to should_equal" do
        Object.new.should_respond_to :should_equal
      end

      it "should not respond to must_equal" do
        Object.new.should_not_respond_to :must_equal
      end
    end

