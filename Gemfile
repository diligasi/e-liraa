source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Core Gems ####################################################################
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Support Gems #################################################################
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'cancancan'
gem 'devise'
gem 'jbuilder', '~> 2.7'
gem 'kaminari', '~> 1.1'

# Assets Gems ##################################################################
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

# Gems per Environment #########################################################
group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner', '~> 1.7'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webdrivers'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'cpf_faker'
  gem 'factory_bot_rails', '~> 5.0'
  gem 'faker', '~> 2.5'
  gem 'figaro'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0.0beta2'
end

group :development do
  gem 'awesome_print'
  gem 'colorize'
  gem 'letter_opener'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
