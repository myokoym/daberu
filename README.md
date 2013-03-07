# Daberu - Create a talkative object.
[![Build Status](https://secure.travis-ci.org/myokoym/daberu.png?branch=master)](http://travis-ci.org/myokoym/daberu)
[![Dependency Status](https://gemnasium.com/myokoym/daberu.png)](https://gemnasium.com/myokoym/daberu)

おしゃべりなオブジェクトをつくることができます。
[You can create a talkative object.]

メソッドが呼ばれると、その情報を指定されたフォーマットで出力します。
[If a method is called, it will output in the format which had the information specified.]

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

    a = Daberu::Talker.new([])
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

    include Daberu  # With liking
    p Talker.format_get(a)  #=> "Class: %s, Method: %s, Arguments: [%s], Block: %s"
    Talker.format_set(a, "%s#%s(%s)")
    p Talker.format_get(a)  #=> "%s#%s(%s)"
    a << 4  #=> "Array#<<(4)"

### Ruby version

開発/テストは1.9系で行なっています。
[Development and Testing on 1.9.x.]

1.8系でも動作しますが、ドキュメントと挙動が違うかもしれません。
[Although 1.8.x operates, an action may differ from documents.]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
