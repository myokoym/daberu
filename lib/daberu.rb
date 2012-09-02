# encoding: utf-8

class Daberu
  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__|method_missing|respond_to?|object_id/
  end

  def initialize(obj = Object.new)
    @obj = obj
  end

  def method_missing(name, *args, &block)
    p "Class: %s, Method: %s, Arguments: %s, Block: %s" %  [@obj.class, name, args, block]
    @obj.send(name, *args, &block)
  end
end

