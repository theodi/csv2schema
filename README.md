[![Build Status](http://img.shields.io/travis/theodi/csv2schema.svg?style=flat-square)](https://travis-ci.org/theodi/csv2schema)
[![Dependency Status](http://img.shields.io/gemnasium/theodi/csv2schema.svg?style=flat-square)](https://gemnasium.com/theodi/csv2schema)
[![Code Climate](http://img.shields.io/codeclimate/github/theodi/csv2schema.svg?style=flat-square)](https://codeclimate.com/github/theodi/csv2schema)
[![Gem Version](http://img.shields.io/gem/v/csv2schema.svg?style=flat-square)](https://rubygems.org/gems/csv2schema)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://theodi.mit-license.org)

# Csv2schema

Automagically generate a JSON table schema file to go with a CSV file. Inspired by Stuart Lowe's [JSON Table Schema Generator](https://odileeds.github.io/JSONSchema/) at [ODI Leeds](https://leeds.theodi.org).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'csv2schema'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install csv2schema

## Usage

Require the gem (if you haven't already):

```ruby
require 'csv2schema'
```

Initialise the CSV with a file:

```ruby
csv = Csv2schema::CSV.new(File.open("path/to/file.csv"))
```

Or with a URL:

```ruby
csv = Csv2schema::CSV.new("http://example.org/file.csv")
```

Or with an IO-style object (i.e StringIO):

```ruby
csv = Csv2schema::CSV.new(StringIO.new( my_data_in_a_string ))
```

Then get the schema as a JSON string:

```ruby
csv.schema
#=> "{\"fields\":[{\"name\":\"Foo\",\"title\":\"Foo\",\"constraints\":{\"required\":false,\"type\":\"http://www.w3.org/2001/XMLSchema#int\"}},{\"name\":\"Bar\",\"title\":\"Bar\",\"constraints\":{\"required\":true,\"type\":\"http://www.w3.org/2001/XMLSchema#int\"}},{\"name\":\"Baz\",\"title\":\"Baz\",\"constraints\":{\"required\":true,\"type\":\"http://www.w3.org/2001/XMLSchema#int\"}}]}"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/theodi/csv2schema. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
