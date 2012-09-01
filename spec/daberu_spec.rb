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
      lines[0].should =~ /Method: <<, Arguments: \[(\\)*"a(\\)*"\], Block: /
      lines[1].should =~ /Method: each, Arguments: \[\], Block: #<Proc:/
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
      lines[0].should =~ /Method: class, Arguments: \[\], Block: /
    }
  end 
end

