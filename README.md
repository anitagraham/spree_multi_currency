# Spree Multi-Currency

[![Build Status](https://travis-ci.org/spree-contrib/spree_multi_currency.svg?branch=master)](https://travis-ci.org/spree-contrib/spree_multi_currency)
[![Code Climate](https://codeclimate.com/github/spree-contrib/spree_multi_currency/badges/gpa.svg)](https://codeclimate.com/github/spree-contrib/spree_multi_currency)

Provides UI to allow configuring multiple currencies in Spree.

We're planning to pull this gem into Spree 4.2.

## Installation

1. Add this extension to your Gemfile with this line:

    ```ruby
    gem 'spree_multi_currency', github: 'spree-contrib/spree_multi_currency'
    ```

2. Install the gem using Bundler

    ```ruby
    bundle install
    ```

3. Copy & run migrations

    ```ruby
    bundle exec rails g spree_multi_currency:install
    ```

5. Restart your server

    If your server was running, restart it so that it can find the assets properly.

---

## Contributing

See corresponding [guidelines][1]

---

## License

Copyright (c) 2007-2020 [Gregor MacDougall][5], [Spree Commerce][2], and other [contributors][3], released under the [New BSD License][4]

[1]: https://github.com/spree-contrib/spree_multi_currency/blob/master/CONTRIBUTING.md
[2]: https://github.com/spree
[3]: https://github.com/spree-contrib/spree_multi_currency/contributors
[4]: https://github.com/spree-contrib/spree_multi_currency/blob/master/LICENSE.md
[5]: https://github.com/freerunningtech
