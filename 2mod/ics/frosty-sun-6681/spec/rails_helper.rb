# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start

require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

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
    @hospital1 = create(:hospital)
    @hospital2 = create(:hospital)
    @hospital3 = create(:hospital)

    @doctor1 = create(:doctor, hospital: @hospital1)
    @doctor2 = create(:doctor, hospital: @hospital1)
    @doctor3 = create(:doctor, hospital: @hospital1)
    @doctor4 = create(:doctor, hospital: @hospital1)
    @doctor5 = create(:doctor, hospital: @hospital2)
    @doctor6 = create(:doctor, hospital: @hospital2)
    @doctor7 = create(:doctor, hospital: @hospital2)
    @doctor8 = create(:doctor, hospital: @hospital3)
    @doctor9 = create(:doctor, hospital: @hospital3)

    @patient1 = create(:patient, :adult, name: 'Bob')
    @patient2 = create(:patient, :adult, name: 'Sally')
    @patient3 = create(:patient, :adult, name: 'John')
    @patient4 = create(:patient, :adult, name: 'Jane')
    @patient5 = create(:patient, :adult, name: 'Sue')
    @patient6 = create(:patient, :adult, name: 'Bill')
    @patient7 = create(:patient, :adult, name: 'Jill')
    @patient8 = create(:patient, :adult, name: 'Joe')
    @patient9 = create(:patient, :adult, name: 'Mike')
    @patient10 = create(:patient, :adult, name: 'Tom')
    @patient11 = create(:patient, :adult, name: 'Tim')
    @patient12 = create(:patient, :adult, name: 'Allie')
    @patient13 = create(:patient, :adult, name: 'Livia')
    @patient14 = create(:patient, :adult, name: 'Lily')
    @child_patient = create(:patient, :child, name: 'Ari')

    @doctor_patient1 = create(:doctor_patient, doctor: @doctor1, patient: @patient1)
    @doctor_patient2 = create(:doctor_patient, doctor: @doctor1, patient: @patient2)
    @doctor_patient3 = create(:doctor_patient, doctor: @doctor1, patient: @patient3)
    @doctor_patient4 = create(:doctor_patient, doctor: @doctor1, patient: @patient4)
    @doctor_patient5 = create(:doctor_patient, doctor: @doctor1, patient: @patient5)
    @doctor_patient6 = create(:doctor_patient, doctor: @doctor2, patient: @patient2)
    @doctor_patient7 = create(:doctor_patient, doctor: @doctor2, patient: @patient3)
    @doctor_patient8 = create(:doctor_patient, doctor: @doctor2, patient: @patient4)
    @doctor_patient9 = create(:doctor_patient, doctor: @doctor2, patient: @patient5)
    @doctor_patient10 = create(:doctor_patient, doctor: @doctor3, patient: @patient3)
    @doctor_patient11 = create(:doctor_patient, doctor: @doctor3, patient: @patient4)
    @doctor_patient12 = create(:doctor_patient, doctor: @doctor3, patient: @patient5)
    @doctor_patient13 = create(:doctor_patient, doctor: @doctor4, patient: @patient4)
    @doctor_patient14 = create(:doctor_patient, doctor: @doctor4, patient: @patient5)
    @doctor_patient15 = create(:doctor_patient, doctor: @doctor5, patient: @patient5)
    @doctor_patient16 = create(:doctor_patient, doctor: @doctor5, patient: @patient6)
    @doctor_patient17 = create(:doctor_patient, doctor: @doctor5, patient: @patient7)
    @doctor_patient18 = create(:doctor_patient, doctor: @doctor6, patient: @patient6)
    @doctor_patient19 = create(:doctor_patient, doctor: @doctor6, patient: @patient7)
    @doctor_patient20 = create(:doctor_patient, doctor: @doctor6, patient: @patient8)
    @doctor_patient21 = create(:doctor_patient, doctor: @doctor7, patient: @patient7)
    @doctor_patient22 = create(:doctor_patient, doctor: @doctor7, patient: @patient8)
    @doctor_patient23 = create(:doctor_patient, doctor: @doctor7, patient: @patient9)
    @doctor_patient24 = create(:doctor_patient, doctor: @doctor8, patient: @patient10)
    @doctor_patient25 = create(:doctor_patient, doctor: @doctor8, patient: @patient11)
    @doctor_patient26 = create(:doctor_patient, doctor: @doctor8, patient: @patient12)
    @doctor_patient27 = create(:doctor_patient, doctor: @doctor9, patient: @patient13)
    @doctor_patient28 = create(:doctor_patient, doctor: @doctor9, patient: @patient14)
    @doctor_patient29 = create(:doctor_patient, doctor: @doctor9, patient: @child_patient)
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
