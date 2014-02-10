### Regional Indicators

#### Development environment setup

Clone the repository and cd into it.

The .ruby-gemset and .ruby-version files specify

+ gemset: regionalindicators
+ ruby: ruby-2.0.0-p247

Then run `bundle install` to install all the gems.

#### Install ImageMagick

Install [ImageMagick](http://www.imagemagick.org/).

Before uploading visualization images, ImageMagick is used to convert the files.

On Mac OS X, you might be able to install with [Homebrew](http://brew.sh/).

If you don't have Homebrew, run `ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`.

Once you have Homebrew, run `brew install imagemagick`.

You may need to rebundle your gems: `bundle install`.

#### Seed the database.

Database fixtures are stored in `db/fixtures` and `db/seeds.rb`.

`db/seeds.rb` reads from CSVs stored in `db/fixtures` and populates the database from them.

Each of the fixture classes has its own method in `db/seeds.rb`. If you are seeding the whole database from scratch, uncomment all the methods at the bottom.


#### Tests

Tests are in `spec`. Run `rspec` to run unit tests and integration tests.

This app is using the Test-Driven Development paradigm. If you are adding a feature, make sure to add the tests first.