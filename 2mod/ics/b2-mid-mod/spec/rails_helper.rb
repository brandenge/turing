require 'simplecov'

SimpleCov.start do
  enable_coverage :branch
  add_filter "spec/rails_helper.rb"
end

require './spec/fixtures/department_data'
require './spec/fixtures/employee_data'
require './spec/fixtures/ticket_data'

include DepartmentData
include EmployeeData
include TicketData

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
    @dept_1 = Department.create!(DEPT_1)
    @dept_2 = Department.create!(DEPT_2)
    @dept_3 = Department.create!(DEPT_3)

    @employee_1 = @dept_1.employees.create!(EMPLOYEE_1)
    @employee_2 = @dept_1.employees.create!(EMPLOYEE_2)
    @employee_3 = @dept_2.employees.create!(EMPLOYEE_3)
    @employee_4 = @dept_2.employees.create!(EMPLOYEE_4)
    @employee_5 = @dept_3.employees.create!(EMPLOYEE_5)

    @ticket_1 = Ticket.create!(TICKET_1)
    @ticket_2 = Ticket.create!(TICKET_2)
    @ticket_3 = Ticket.create!(TICKET_3)
    @ticket_4 = Ticket.create!(TICKET_4)
    @ticket_5 = Ticket.create!(TICKET_5)

    @employee_ticket_1 = EmployeeTicket.create!(employee_id: @employee_1.id, ticket_id: @ticket_1.id)
    @employee_ticket_2 = EmployeeTicket.create!(employee_id: @employee_2.id, ticket_id: @ticket_1.id)
    @employee_ticket_3 = EmployeeTicket.create!(employee_id: @employee_2.id, ticket_id: @ticket_2.id)
    @employee_ticket_4 = EmployeeTicket.create!(employee_id: @employee_3.id, ticket_id: @ticket_2.id)
    @employee_ticket_5 = EmployeeTicket.create!(employee_id: @employee_3.id, ticket_id: @ticket_3.id)
    @employee_ticket_6 = EmployeeTicket.create!(employee_id: @employee_4.id, ticket_id: @ticket_3.id)
    @employee_ticket_7 = EmployeeTicket.create!(employee_id: @employee_4.id, ticket_id: @ticket_4.id)
    @employee_ticket_8 = EmployeeTicket.create!(employee_id: @employee_5.id, ticket_id: @ticket_4.id)
    @employee_ticket_9 = EmployeeTicket.create!(employee_id: @employee_5.id, ticket_id: @ticket_5.id)
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
