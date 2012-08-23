# Daberu

おしゃべりなオブジェクトをつくることができます。

[You can create a talkative object.]

## Installation

Add this line to your application's Gemfile:

    gem 'daberu'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install daberu

## Usage

    require 'daberu'

    d = Daberu.new
    d.puts "Whoops!"
    #=> "Method: puts, Arguments: [\"Whoops!\"], Block: "
        Whoops!

    a = Daberu.new([])
    a << 1
    a << 2
    a << 3
    a.each do |i|
      p i
    end
    #=> "Method: <<, Arguments: [1], Block: "
        "Method: <<, Arguments: [2], Block: "
        "Method: <<, Arguments: [3], Block: "
        "Method: each, Arguments: [], Block: #<Proc:0x9d32db4@daberu.rb:23>"
        1
        2
        3

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
