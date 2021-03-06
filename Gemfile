source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.6'
gem "pg", "~> 0.18"
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootstrap-sass', '~> 3.3'
gem 'carrierwave'
gem 'mini_magick'
gem 'md_simple_editor'
gem 'redcarpet'
gem 'acts-as-taggable-on', '~> 4.0'
gem 'kaminari', github: 'amatsuda/kaminari', branch: 'master'
gem 'friendly_id', '~> 5.1.0'
gem 'acts_as_paranoid', '~> 0.5.0'
gem 'config'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'devise'
gem 'google-analytics-rails', '1.1.1'
gem 'react-rails'
gem 'responders'
gem 'jwt'


group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'seed_dump'
  gem 'traceroute'
  gem 'rack-mini-profiler'
  gem 'bullet'
  gem 'brakeman', :require => false
  gem 'rails_best_practices'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
