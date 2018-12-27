# HomePage
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'home_page'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install home_page
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

##congig > initializers > devise.rb
Devise.setup do |config|
  config.router_name = :home_page
  config.parent_controller = 'HomePage::ApplicationController'
  config.secret_key = 'bcfb15e07bb7d0a6b0d6521285eeec8294260a88df7402f2b5697f6d1cd0679a878273b692b94b846fc8011cb56d62c0b21e3985c29afaaf73dab049145f10e0'
end
