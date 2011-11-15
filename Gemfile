source "http://rubygems.org"

gemspec

group :development, :test do
  gem "rake"

  gem "rspec", "~> 2.7"
  gem "rack-test"
  gem "webmock"  
  gem "guard"
  gem "guard-rspec"

  if RUBY_PLATFORM =~ /darwin/i          
    gem "rb-fsevent", :require => false  
    gem "growl_notify", :require => false
  end                                    
end

group :example do 
  gem "sinatra"
end
