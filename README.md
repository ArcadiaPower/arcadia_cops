Arcadia Power Rubocop Configuration
===================================
 The arcadia_cops gem contains enabled and customized [rubocop](https://github.com/bbatsov/rubocop) cops to check and enforce our style guide.

## Install

```ruby
# Add to your gemfile
gem 'arcadia_cops'
```

Then setup your `.rubocop.yml` file per [rubocop docs](http://rubocop.readthedocs.io/en/latest/configuration/#inheriting-configuration-from-a-dependency-gem).


## Development

Add a new cop to the `enabled.yml`, bump the version, and put in a PR for review.

To see all cops including those that aren't enabled run `bundle exec rubocop --show-cops`.

## Release

Ensure you have bumped the version and run `rake release` to release to rubygems.org.

## Codeclimate

Codeclimate doesn't support `inherit_gem` but does support loading from a remote url.

To concatentate together our rules into a single yml file run `bin/build`. This will regenerate `dist/.rubocop-rails.yml` and `dist/.rubocop-ruby`. This can be referenced directly from github.

If using any customization within a repo you will need to generate your own explicit files.

## Other

`arcadia_cops` also maintains the rubocop version to maintain parity across repos.
