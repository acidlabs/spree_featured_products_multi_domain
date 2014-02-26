spree_featured_products
=======================

Introduction goes here.

Installation
------------

Add spree_featured_products to your Gemfile:

```ruby
gem 'spree_featured_products_multi_domain'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_featured_products_multi_domain:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_featured_products_multi_domain/factories'
```

Copyright (c) 2014 [Acid Labs][acidlabs], released under the New BSD License

[acidlabs]: https://github.com/acidlabs
