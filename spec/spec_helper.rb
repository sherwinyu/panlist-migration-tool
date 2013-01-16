# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

def delete_all_records
  Ownership.delete_all
  Panlist.delete_all
  Owner.delete_all
end

def create_records
  @p1 = Panlist.create name: 'directorslist', public: false, subscribers: "a@b.c\nd@e.f\ng@r.f" 
  @p2 = Panlist.create name: 'cat3rocks', public: false, subscribers: "coolcat@one.com\ncoolcat@two.com\ncoolcat@three.com" 
  @p3 = Panlist.create name: 'emilys-freshmen', public: true, subscribers: "aaa@b.c\nd@e.f\ng@r.f"


  @o1 = Owner.find_or_create_by_netid  'sy23'
  @o2 = Owner.find_or_create_by_netid  'alb64'
  @o3 = Owner.find_or_create_by_netid  'icc7'
  @o4 = Owner.find_or_create_by_netid  'lt275'
  @o5 = Owner.find_or_create_by_netid  'rx8'
  @o6 = Owner.find_or_create_by_netid  'ft66'
  @o7 = Owner.find_or_create_by_netid  'jmq23'
  @o8 = Owner.find_or_create_by_netid  'ayl8'

  @os1 = Ownership.create panlist_id: @p1.id, owner_id: @o1.netid
  @os2 = Ownership.create panlist_id: @p1.id, owner_id: @o2.netid
  @os3 = Ownership.create panlist_id: @p1.id, owner_id: @o3.netid

  @os4 = Ownership.create panlist_id: @p2.id, owner_id: @o1.netid
  @os5 = Ownership.create panlist_id: @p2.id, owner_id: @o2.netid
  @os6 = Ownership.create panlist_id: @p2.id, owner_id: @o7.netid
  @os7 = Ownership.create panlist_id: @p2.id, owner_id: @o8.netid

  @e1 = Elilist.create name: 'directorslist', subscribers: "a@b.c\nd@e.f\ng@r.f", owners: [@o1, @o2, @o3].map(&:netid) * "\n"
end

def reset_records
  delete_all_records
  create_records
end
