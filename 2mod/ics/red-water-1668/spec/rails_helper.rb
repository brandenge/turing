# This file is copied to spec/ when you run 'rails generate rspec:install'

require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
  add_filter "spec/rails_helper.rb"
end

require './app/helpers/application_helper'
include ApplicationHelper

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
  config.include FactoryBot::Syntax::Methods

  config.before(:each) do
    @chef_1 = create(:chef)
    @chef_2 = create(:chef)
    @chef_3 = create(:chef)
    @chef_4 = create(:chef)
    @chef_5 = create(:chef)

    @dish_1 = create(:dish, chef: @chef_1)
    @dish_2 = create(:dish, chef: @chef_1)
    @dish_3 = create(:dish, chef: @chef_1)
    @dish_4 = create(:dish, chef: @chef_2)
    @dish_5 = create(:dish, chef: @chef_2)
    @dish_6 = create(:dish, chef: @chef_2)
    @dish_7 = create(:dish, chef: @chef_3)
    @dish_8 = create(:dish, chef: @chef_3)
    @dish_9 = create(:dish, chef: @chef_3)
    @dish_10 = create(:dish, chef: @chef_4)
    @dish_11 = create(:dish, chef: @chef_4)
    @dish_12 = create(:dish, chef: @chef_4)
    @dish_13 = create(:dish, chef: @chef_5)
    @dish_14 = create(:dish, chef: @chef_5)
    @dish_15 = create(:dish, chef: @chef_5)

    @ingredient_1 = create(:ingredient, calories: 100)
    @ingredient_2 = create(:ingredient, calories: 200)
    @ingredient_3 = create(:ingredient, calories: 300)
    @ingredient_4 = create(:ingredient, calories: 50)
    @ingredient_5 = create(:ingredient)
    @ingredient_6 = create(:ingredient)
    @ingredient_7 = create(:ingredient)
    @ingredient_8 = create(:ingredient)
    @ingredient_9 = create(:ingredient)
    @ingredient_10 = create(:ingredient)
    @ingredient_11 = create(:ingredient)
    @ingredient_12 = create(:ingredient)
    @ingredient_13 = create(:ingredient)
    @ingredient_14 = create(:ingredient)
    @ingredient_15 = create(:ingredient)

    @dish_ingredient_1 = create(:dish_ingredient, dish: @dish_1, ingredient: @ingredient_1)
    @dish_ingredient_2 = create(:dish_ingredient, dish: @dish_1, ingredient: @ingredient_2)
    @dish_ingredient_3 = create(:dish_ingredient, dish: @dish_1, ingredient: @ingredient_3)
    @dish_ingredient_4 = create(:dish_ingredient, dish: @dish_2, ingredient: @ingredient_2)
    @dish_ingredient_5 = create(:dish_ingredient, dish: @dish_2, ingredient: @ingredient_3)
    @dish_ingredient_6 = create(:dish_ingredient, dish: @dish_2, ingredient: @ingredient_4)
    @dish_ingredient_7 = create(:dish_ingredient, dish: @dish_3, ingredient: @ingredient_3)
    @dish_ingredient_8 = create(:dish_ingredient, dish: @dish_3, ingredient: @ingredient_4)
    @dish_ingredient_9 = create(:dish_ingredient, dish: @dish_3, ingredient: @ingredient_5)
    @dish_ingredient_10 = create(:dish_ingredient, dish: @dish_4, ingredient: @ingredient_4)
    @dish_ingredient_11 = create(:dish_ingredient, dish: @dish_4, ingredient: @ingredient_5)
    @dish_ingredient_12 = create(:dish_ingredient, dish: @dish_4, ingredient: @ingredient_6)
    @dish_ingredient_13 = create(:dish_ingredient, dish: @dish_5, ingredient: @ingredient_5)
    @dish_ingredient_14 = create(:dish_ingredient, dish: @dish_5, ingredient: @ingredient_6)
    @dish_ingredient_15 = create(:dish_ingredient, dish: @dish_5, ingredient: @ingredient_7)
    @dish_ingredient_16 = create(:dish_ingredient, dish: @dish_6, ingredient: @ingredient_6)
    @dish_ingredient_17 = create(:dish_ingredient, dish: @dish_6, ingredient: @ingredient_7)
    @dish_ingredient_18 = create(:dish_ingredient, dish: @dish_6, ingredient: @ingredient_8)
    @dish_ingredient_19 = create(:dish_ingredient, dish: @dish_7, ingredient: @ingredient_7)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_7, ingredient: @ingredient_8)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_7, ingredient: @ingredient_9)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_8, ingredient: @ingredient_8)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_8, ingredient: @ingredient_9)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_8, ingredient: @ingredient_10)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_9, ingredient: @ingredient_9)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_9, ingredient: @ingredient_10)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_9, ingredient: @ingredient_11)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_10, ingredient: @ingredient_10)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_10, ingredient: @ingredient_11)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_10, ingredient: @ingredient_12)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_11, ingredient: @ingredient_11)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_11, ingredient: @ingredient_12)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_11, ingredient: @ingredient_13)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_12, ingredient: @ingredient_12)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_12, ingredient: @ingredient_13)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_12, ingredient: @ingredient_14)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_13, ingredient: @ingredient_13)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_13, ingredient: @ingredient_14)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_13, ingredient: @ingredient_15)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_14, ingredient: @ingredient_14)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_14, ingredient: @ingredient_15)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_14, ingredient: @ingredient_1)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_15, ingredient: @ingredient_15)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_15, ingredient: @ingredient_1)
    @dish_ingredient_20 = create(:dish_ingredient, dish: @dish_15, ingredient: @ingredient_2)
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
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
