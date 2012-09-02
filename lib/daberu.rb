# encoding: utf-8

class Daberu
  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__|method_missing|respond_to?|object_id/
  end

  attr_accessor :format
  def initialize(obj = Object.new)
    @obj = obj
    @format = "Class: %s, Method: %s, Arguments: %s, Block: %s"
  end

  def method_missing(name, *args, &block)
    p @format %  [@obj.class, name, args, block]
    @obj.send(name, *args, &block)
  end
end

