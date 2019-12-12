source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'
gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem 'jwt'
gem 'jbuilder', '~> 2.5'
gem 'pundit'
gem 'rack-cors'


group :development, :test do
  gem 'hirb'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'faker'
  gem 'factory_bot_rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "figaro" # handle environment variables
end

group :development do
  gem 'spring-commands-rspec'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
