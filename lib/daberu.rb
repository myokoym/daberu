# encoding: utf-8

class Daberu
  def initialize(obj = Object.new)
    @obj = obj
  end

  def method_missing(name, *args, &block)
    p "Method: #{name}, Arguments: #{args}, Block: #{block}"
    @obj.send(name, *args, &block)
  end
end

