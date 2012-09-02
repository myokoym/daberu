# Daberu

おしゃべりなオブジェクトをつくることができます。
[You can create a talkative object.]

主な用途：デバッグ
[One way, Debugging.]

## Installation

Add this line to your application's Gemfile:

    gem 'daberu'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install daberu

## Usage

    require 'daberu'

    a = Daberu.new([])
    a << 1  #=> "Class: Array, Method: <<, Arguments: [1], Block: "
    a << 2  #=> "Class: Array, Method: <<, Arguments: [2], Block: "
    a << 3  #=> "Class: Array, Method: <<, Arguments: [3], Block: "
    a.each do |i|
      p i
    end
    #=> "Class: Array, Method: each, Arguments: [], Block: #<Proc:...>"
        1
        2
        3

    p a.format  #=> "Class: %s, Method: %s, Arguments: [%s], Block: %s"
    a.format = "%s#%s(%s)"
    p a.format  #=> "%s#%s(%s)"
    a << 4  #=> "Array#<<(1)"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
