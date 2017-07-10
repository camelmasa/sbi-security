# SBI Security

Ruby Client for SBI Security

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sbi-security'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sbi-security

## Usage

```
# Show list of stock
sbisec
+--------+--------------+------+----------+--------+--------+---------+---------+----------+-----------+
| コード | 銘柄         | 数量 | 参考単価 | 現在値 | 前日比 | 前日(%) | 損益    | 損益(%)  | 評価額    |
+--------+--------------+------+----------+--------+--------+---------+---------+----------+-----------+
| 3633   | ＧＭＯぺパボ | 100  | 3,333.57 | 3,385  | +5     | +0.15   | +500    | +1.54    | 338,500   |
+--------+--------------+------+----------+--------+--------+---------+---------+----------+-----------+
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'camlemasa'/sbi-security.
