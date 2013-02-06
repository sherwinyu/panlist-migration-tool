require 'gappsprovisioning/provisioningapi.rb'

class Elilist < ActiveRecord::Base
  include GAppsProvisioning
  attr_accessible :list_type, :name, :owners, :subscribers
  attr_accessor :members
  attr_accessor :owners_arr

  def create_google_group
    # convert to dev / prod domain
    adminuser = "sherwin@gsbx.yale.edu" # TODO(syu): Figure out what to put here
    password  = "plmt_temp!!"

    google = ProvisioningApi.new(adminuser, password)
    group_id = name # may need to dasherize
    group_name = name


    # TODO(syu): double check how group types work
    group_type = case list_type
      when 'Announcement' then 'Owner'
      when 'Moderated' then 'Member'
      when 'Discussion' then 'Anyone'
      else 'Owner'
      end

    group = google.create_group group_id, [group_name, 'just a description', group_type]

    subscribers.each do |subscriber| 
      # subscriber.slice![ /[^@]*/ ] # extract portion of email address before '@', necessary for add_member_to_group api
      google.add_member_to_group subscriber, group_id
    end
    owners.each do |owner| 
      # owner.slice![ /[^@]*/ ] # extract portion of email address before '@', necessary for add_member_to_group api
      google.add_member_to_group owner, group_id # make sure is a member before is an owner
      google.add_owner_to_group owner, group_id
    end
  end

  def owners_arr
    owners.split
  end

  def subscribers_arr
    subscribers.split
  end

end
