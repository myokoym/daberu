# encoding: utf-8

require 'daberu'

describe Daberu do
  it "is no argument" do
    d = Daberu.new
    d.class.should == Daberu
  end

  it "is Array object" do
    a = Daberu.new([])
    a << "a"
    a << "b"
    a << "c"
    actual = []
    a.each do |i|
      actual << i
    end
    actual.should == %w[a b c]
  end
end

