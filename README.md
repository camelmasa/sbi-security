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
+--------+--------------+--------+--------+---------+-------+-------+-------+----------+--------+-----------+
| コード | 銘柄         | 現在値 | 前日比 | 前日(%) | 始値  | 高値  | 安値  | 前日終値 | 出来高 | 売買代金  |
+--------+--------------+--------+--------+---------+-------+-------+-------+----------+--------+-----------+
| 3633   | ＧＭＯペパボ | 3,390  | -20    | -0.59   | 3,405 | 3,405 | 3,380 | 3,410    | 500    | 1,696,000 |
+--------+--------------+--------+--------+---------+-------+-------+-------+----------+--------+-----------+


+------------+--------+------------+
| 売気配株数 | 気配値 | 買気配株数 |
+------------+--------+------------+
| 3,800      | OVER   |            |
| 100        | 3,490  |            |
| 400        | 3,450  |            |
| 500        | 3,445  |            |
| 500        | 3,435  |            |
| 400        | 3,430  |            |
| 100        | 3,420  |            |
| 1,300      | 3,415  |            |
| 200        | 3,410  |            |
| 300        | 3,405  |            |
| 前 200     | 3,400  |            |
|            | 3,390  | 前 500     |
|            | 3,370  | 400        |
|            | 3,365  | 200        |
|            | 3,360  | 200        |
|            | 3,355  | 100        |
|            | 3,350  | 200        |
|            | 3,345  | 200        |
|            | 3,340  | 200        |
|            | 3,335  | 200        |
|            | 3,330  | 300        |
|            | UNDER  | 3,000      |
+------------+--------+------------+
```

## TODO

- Implement `Sbi::Security::Client#buy`
- Implement `Sbi::Security::Client#sell`
- Update cli options
  - Like `sbisec buy 3633 3300 100` and `sbisec sell 3633 3000 100`
- Add test

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/camelmasa/sbi-security.
