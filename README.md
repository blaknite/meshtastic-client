# Meshtastic Ruby Client

Ruby client for meshtastic devices - https://meshtastic.org

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add meshtastic-client --github "blaknite/meshtastic-client"

## Usage

```ruby
puts "Connecting to Meshtastic node..."
@device = Meshtastic.connect(:serial, port: @port)
puts "Connected to Meshtastic node number #{@device.node_num}.\n\n"

@device.on(:packet, lambda { |packet|
  handle_packet(packet)
})

loop do
  sleep 1
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blaknite/meshtastic-client.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
