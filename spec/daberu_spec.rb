# encoding: utf-8

require 'daberu'
require 'tempfile'

describe Daberu do
  it "is no argument" do
    t = Tempfile.open("daberu")
    $stdout = File.open(t, "w")
    d = Daberu.new
    d.class.should == Object
    $stdout.flush
    $stdout = STDOUT
  end 

  it "is Array object" do
    t = Tempfile.open("daberu")
    $stdout = File.open(t, "w")
    a = Daberu.new([])
    a << "a"
    a << "b"
    a << "c"
    actual = []
    a.each do |i|
      actual << i
    end
    $stdout.flush
    $stdout = STDOUT
    actual.should == %w[a b c]
  end

  it "is stdout" do
    t = Tempfile.open("daberu")
    $stdout = File.open(t, "w")
    a = Daberu.new([])
    a << "a"
    actual = []
    a.each do |i|
      actual << i
    end
    $stdout.flush
    $stdout = STDOUT
    File.open(t) {|f|
      lines = f.read.split(/\n/)
      lines[0].should =~ /Class: Array, Method: <<, Arguments: \[(\\)*"a(\\)*"\], Block: /
      lines[1].should =~ /Class: Array, Method: each, Arguments: \[\], Block: #<Proc:/
    }
  end

  it "is stdout of no argument" do
    t = Tempfile.open("daberu")
    $stdout = File.open(t, "w")
    d = Daberu.new
    d.class
    $stdout.flush
    $stdout = STDOUT
    File.open(t) {|f|
      lines = f.read.split(/\n/)
      lines[0].should =~ /Class: Object, Method: class, Arguments: \[\], Block: /
    }
  end 

  it "is point of stdout format" do
    t = Tempfile.open("daberu")
    $stdout = File.open(t, "w")
    d = Daberu.new
    Daberu.format_set(d, "%s#%s(%s): %s")
    d.class
    $stdout.flush
    $stdout = STDOUT
    File.open(t) {|f|
      lines = f.read.split(/\n/)
      lines[0].should =~ /Object#class\(\): /
    }
  end 

  it "is view of stdout format" do
    t = Tempfile.open("daberu")
    $stdout = File.open(t, "w")
    d = Daberu.new
    $stdout.flush
    $stdout = STDOUT
    Daberu.format_get(d).should == "Class: %s, Method: %s, Arguments: [%s], Block: %s"
  end 
end

