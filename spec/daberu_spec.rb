# encoding: utf-8

require 'daberu'
require 'tempfile'

describe Daberu::Talker do
  before(:each) do
    @t = Tempfile.open("daberu")
    $stdout = File.open(@t, "w")
  end

  it "is no argument" do
    d = Daberu::Talker.new
    d.class.should == Object
  end 

  it "is Array object" do
    a = Daberu::Talker.new([])
    a << "a"
    a << "b"
    a << "c"
    actual = []
    a.each do |i|
      actual << i
    end
    actual.should == %w[a b c]
  end

  it "is stdout" do
    a = Daberu::Talker.new([])
    a << "a"
    actual = []
    a.each do |i|
      actual << i
    end
    File.open(@t) {|f|
      lines = f.read.split(/\n/)
      lines[0].should =~ /Class: Array, Method: <<, Arguments: \[(\\)*"a(\\)*"\], Block: /
      lines[1].should =~ /Class: Array, Method: each, Arguments: \[\], Block: #<Proc:/
    }
  end

  it "is stdout of no argument" do
    d = Daberu::Talker.new
    d.class
    File.open(@t) {|f|
      lines = f.read.split(/\n/)
      lines[0].should =~ /Class: Object, Method: class, Arguments: \[\], Block: /
    }
  end 

  it "is point of stdout format" do
    d = Daberu::Talker.new
    Daberu::Talker.format_set(d, "%s#%s(%s): %s")
    d.class
    File.open(@t) {|f|
      lines = f.read.split(/\n/)
      lines[0].should =~ /Object#class\(\): /
    }
  end 

  it "is view of stdout format" do
    d = Daberu::Talker.new
    Daberu::Talker.format_get(d).should == "Class: %s, Method: %s, Arguments: [%s], Block: %s"
  end 

  it "is get to inner object" do
    obj = Object.new
    d = Daberu::Talker.new(obj)
    Daberu::Talker.object_get(d).should == obj
  end 

  it "is set to inner object" do
    obj1 = Object.new
    d = Daberu::Talker.new(obj1)
    obj2 = Object.new
    Daberu::Talker.object_set(d, obj2)
    Daberu::Talker.object_get(d).should_not == obj1
    Daberu::Talker.object_get(d).should == obj2
  end 

  after do
    $stdout.flush
    $stdout = STDOUT
  end
end

