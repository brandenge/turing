require 'simplecov'
SimpleCov.start

require './spec/fixtures/supermarket_data'
require './spec/fixtures/item_data'
require './spec/fixtures/customer_data'
require './app/helpers/application_helper'

include SupermarketData
include ItemData
include CustomerData
include ApplicationHelper

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.before(:each) do
    @supermarket_1 = Supermarket.create!(SUPERMARKET_1)
    @supermarket_2 = Supermarket.create!(SUPERMARKET_2)
    @supermarket_3 = Supermarket.create!(SUPERMARKET_3)

    @item_1 = @supermarket_1.items.create!(ITEM_1)
    @item_2 = @supermarket_1.items.create!(ITEM_2)
    @item_3 = @supermarket_2.items.create!(ITEM_3)
    @item_4 = @supermarket_2.items.create!(ITEM_4)
    @item_5 = @supermarket_3.items.create!(ITEM_5)

    @customer_1 = Customer.create!(CUSTOMER_1)
    @customer_2 = Customer.create!(CUSTOMER_2)
    @customer_3 = Customer.create!(CUSTOMER_3)
    @customer_4 = Customer.create!(CUSTOMER_4)
    @customer_5 = Customer.create!(CUSTOMER_5)

    @customer_item_1 = CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_1.id)
    @customer_item_2 = CustomerItem.create!(item_id: @item_2.id, customer_id: @customer_1.id)
    @customer_item_3 = CustomerItem.create!(item_id: @item_2.id, customer_id: @customer_2.id)
    @customer_item_4 = CustomerItem.create!(item_id: @item_3.id, customer_id: @customer_2.id)
    @customer_item_5 = CustomerItem.create!(item_id: @item_3.id, customer_id: @customer_3.id)
    @customer_item_6 = CustomerItem.create!(item_id: @item_4.id, customer_id: @customer_3.id)
    @customer_item_7 = CustomerItem.create!(item_id: @item_4.id, customer_id: @customer_4.id)
    @customer_item_8 = CustomerItem.create!(item_id: @item_5.id, customer_id: @customer_4.id)
    @customer_item_9 = CustomerItem.create!(item_id: @item_5.id, customer_id: @customer_5.id)
    @customer_item_10 = CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_5.id)
    @customer_item_11 = CustomerItem.create!(item_id: @item_5.id, customer_id: @customer_3.id)
  end
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
