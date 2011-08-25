source 'http://rubygems.org'

gem 'rails', '3.1.0.rc6'

gem 'haml'
gem 'jquery-rails'

group :assets do
  gem 'sass-rails', "  ~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

group :production do
  gem 'pg'
end

group :production, :development do
  gem 'thin'
end

group :development do
  gem 'annotate'
end

group :development, :test do
  gem 'sqlite3'
end

group :test do
  gem 'autotest'
  gem 'rspec'
  gem 'spork'
end
