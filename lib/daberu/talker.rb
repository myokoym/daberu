# encoding: utf-8

module Daberu
  class Talker
    instance_methods.each do |m|
      undef_method m unless m.to_s =~ /^__|method_missing|respond_to?|object_id/
    end
  
    def initialize(obj = Object.new)
      @obj = obj
      @format = "Class: %s, Method: %s, Arguments: [%s], Block: %s"
    end
  
    def method_missing(name, *args, &block)
      p @format % [@obj.class, name, args.to_s.gsub(/^\[|\]$/, ""), block]
      @obj.send(name, *args, &block)
    end
  
    def self.format_get(obj)
      obj.__daberu_format_get__
    end
  
    def self.format_set(obj, str)
      obj.__daberu_format_set__(str)
    end
  
    def self.object_get(obj)
      obj.__daberu_object_get__
    end
  
    def __daberu_format_get__
      @format
    end
  
    def __daberu_format_set__(str)
      @format = str
    end

    def __daberu_object_get__
      @obj
    end
  end
end

