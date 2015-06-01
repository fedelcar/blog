RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
config.before(:suite) do
  begin
    DatabaseCleaner.start
    FactoryGirl.lint
  ensure
    DatabaseCleaner.clean
  end
end
