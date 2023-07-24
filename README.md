# Guard::Zeitwerk

Automatically adds the module definitions to blank files, inflected from Zeitwerk. This means if you run `touch ./lib/my-gem/fizz/buzz.rb` and open the file, you'll see:

```ruby
module MyGem::Fizz
  class Buzz
  end
end
```

Or from your favorite code editor, create a file, save it, reload the file, and your module will be ready for coding. No more boilerplate!

> *** Note
> Future versions of Guard Zeitwerk will allow greater customization for generated files. This initial release focuses on getting the basics out into the world.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add guard-zeitwerk

Then add to your project's `Guardfile` by running:

    $ bundle exec guard init rspec

## Limitations

Guard Zeitwerk currently does not inflect on whether or not the namespace that's being generated is a class or module. Future releases will likely include the behavior.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rubymonolith/guard-zeitwerk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/rubymonolith/guard-zeitwerk/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Guard::Zeitwerk project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rubymonolith/guard-zeitwerk/blob/main/CODE_OF_CONDUCT.md).
