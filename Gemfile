source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'rails-api', '~> 0.4.0'
gem 'active_model_serializers', '~> 0.8.3'
gem 'pg', '~> 0.18.2'
gem 'sdoc', '~> 0.4.0', group: :doc
gem "puma"
gem 'devise', '~> 3.5.1'
gem 'simple_enum', '~> 2.1.1'
gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  gem 'faker'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem "figaro", :git => "https://github.com/laserlemon/figaro.git", :tag => "0-stable"
  gem "pry"
end

group :production, :staging do
  gem "rails_12factor"
end
