require 'gappsprovisioning/provisioningapi.rb'

class Elilist < ActiveRecord::Base
  include GAppsProvisioning
  attr_accessible :list_type, :name, :list_id, :owners, :subscribers
  attr_accessor :members
  attr_accessor :owners_arr

  def google_group_type
    return case list_type
      when 'Announcement' then 'Owner'
      when 'Moderated' then 'Member'
      when 'Discussion' then 'Anyone'
      else 'Owner'
      end
  end

  def create_google_group
    # convert to dev / prod domain
    adminuser =  "sherwin.yu@gsbx.yale.edu"
    adminuser =  "sherwin@communificiency.com"
    password  = ENV['GG_PW']

    binding.pry
    google = ProvisioningApi.new(adminuser, password)
=begin

    # TODO(syu): double check how group types work
    group_type = google_group_type
    binding.pry
    group = google.create_group list_id, [name, 'just a description', group_type]

    subscribers.each do |subscriber| 
      google.add_member_to_group subscriber, group_id
    end
    owners.each do |owner| 
      google.add_member_to_group owner, group_id # make sure is a member before is an owner
      google.add_owner_to_group owner, group_id
    end
=end
  end

  def owners_arr
    owners.split
  end

  def subscribers_arr
    subscribers.split
  end

end
