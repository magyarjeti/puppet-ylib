require 'spec_helper'

describe "the smooth function" do
  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  it "should exist" do
    Puppet::Parser::Functions.function("smooth").should == "function_smooth"
  end

  it "should raise a ParseError if there is less than 1 arguments" do
    lambda { scope.function_smooth([]) }.should(raise_error(Puppet::ParseError))
  end

  it "should raise a ParseError if the 1st argument is not a hash" do
    lambda { scope.function_smooth([1]) }.should(raise_error(Puppet::ParseError))
  end

  it "should flatten hash otherwise" do
    input_hash = {
      "foo" => 1,
      "bar" => {
        "baz" => "qux"
      }
    }

    output_hash = {
      "foo"     => 1,
      "bar.baz" => "qux"
    }

    result = scope.function_smooth([input_hash])

    result.should(eq(output_hash))
  end
end
