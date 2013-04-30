# ActsAsTaggableOnDynamic
This plugin is an extension to the amazing acts-as-taggable-on plugin which allows to tag different models. The dynamic extension
allows to use the standard rails form generators and integrates dynamic contexts for the tags. It's nothing more needed than
adding some helpers into your form view.

## Compatibility

Versions 0.0.x are compatible with Ruby 1.9.3 and Rails 3.

## Installation

Ensure that act-as-taggable-on is installed and well configured. To use this plugin, add it to your Gemfile:

```ruby
gem 'acts-as-taggable-on-dynamic'
```

and bundle:

```ruby
bundle
```

## Testing

Acts As Taggable On Dynamic uses RSpec for its test coverage. Inside the gem
directory, you can run the specs with:

```shell
bundle
rake spec
```

If you want, add a `.ruby-version` file in the project root (and use rbenv or RVM) to work on a specific version of Ruby.

## Usage

## Maintainer

* [Dirk Eisenberg](https://github.com/dei79)

## License

See [LICENSE](https://github.com/mbleigh/acts-as-taggable-on-dynamic/blob/master/LICENSE.md)
