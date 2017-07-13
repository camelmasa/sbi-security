# SBI Security

Ruby Client for SBI Security

## Installation

Note: You need to install Google Chrome and [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads) for crawling.

Add this line to your application's Gemfile:

```ruby
gem 'sbi-security'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sbi-security

## Usage

Note: You need to set environment variables `SBI_SECURITY_USER_ID` and `SBI_SECURITY_PASSWORD`)

### Show portfolio

```
$ sbisec portfolio

+--------+--------------+------+----------+--------+--------+---------+---------+----------+-----------+
| コード | 銘柄         | 数量 | 参考単価 | 現在値 | 前日比 | 前日(%) | 損益    | 損益(%)  | 評価額    |
+--------+--------------+------+----------+--------+--------+---------+---------+----------+-----------+
| 3633   | ＧＭＯぺパボ | 100  | 3,333.57 | 3,385  | +5     | +0.15   | +500    | +1.54    | 338,500   |
+--------+--------------+------+----------+--------+--------+---------+---------+----------+-----------+
```

### Show stock

$ sbisec stock 3633

```
+--------+--------------+--------+--------+---------+
| コード | 銘柄         | 現在値 | 前日比 | 前日(%) |
+--------+--------------+--------+--------+---------+
| 3633   | ＧＭＯペパボ | 3,410  | +40    | +1.19   |
+--------+--------------+--------+--------+---------+
```

## TODO

- Implement `Sbi::Security::Client#buy`
- Implement `Sbi::Security::Client#sell`
- Update cli options
  - Like `sbisec buy 3633 3300 100` and `sbisec sell 3633 3000 100`
- Add test

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/camelmasa/sbi-security.
