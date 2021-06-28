-### Hexlet tests and linter status:
-[![Actions Status](https://github.com/DNNX/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/DNNX/rails-project-lvl1/actions)

# HexletCode

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

A gem like SimpleForm.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hexlet_code

## Usage

```ruby
require 'hexlet_code'

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new job: 'hexlet', gender: 'f'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
  f.input :gender, as: :select, collection: %w[f m]
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input type="text" name="name">
#
#   <label for="job">Job</label>
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
#
#   <label for="gender">Gender</label>
#   <select name="gender">
#     <option value="f" selected>f</option>
#     <option value="m">m</option>
#   </select>
#
#   <input type="submit" value="Save" name="commit">
# </form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DNNX/hexlet_code.
