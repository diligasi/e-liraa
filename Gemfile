source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Core Gems ####################################################################
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Support Gems #################################################################
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'cancancan'
gem 'devise'
gem 'jbuilder', '~> 2.7'
gem 'kaminari', '~> 1.1'

# Assets Gems ##################################################################
gem 'chartkick'
gem 'groupdate'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

# Gems per Environment #########################################################
group :test do
  gem 'capybara', '>= 3.26'
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webdrivers'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'cpf_faker'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.19'
  gem 'figaro'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
end

group :development do
  gem 'awesome_print'
  gem 'colorize'
  gem 'letter_opener'
  gem 'listen', '~> 3.7'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  gem 'web-console', '~> 4.2'
end

group :production, :staging do
  gem 'bugsnag'
  gem 'heroku-deflater'
  gem 'smtpapi'
end
