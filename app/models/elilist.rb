require 'gappsprovisioning/provisioningapi.rb'

class Elilist < ActiveRecord::Base
  include GAppsProvisioning
  attr_accessible :list_type, :name, :list_id, :owners_raw, :subscribers_raw
  # attr_accessor :owners, :subscribers

  def google_group_type
    return case list_type
      when 'Announcement' then 'Owner'
      when 'Moderated' then 'Member'
      when 'Discussion' then 'Anyone'
      else 'Owner'
      end
  end
  def google_group_id
    val = list_id || name
    # dasherize the id
    val.gsub /\s+/, "-"
  end

  def create_google_group
    # convert to dev / prod domain
    adminuser =  "sherwin.yu@gsbx.yale.edu"
    adminuser =  "sherwin@communificiency.com"
    password  = Plmt::Application.config.google_data_pw

    google = ProvisioningApi.new(adminuser, password)

    # TODO(syu): double check how group types work
    list_id ||= name

    group_type = self.google_group_type
    group_id = self.google_group_id
    group = google.create_group list_id, [name, 'just a description', group_type]
    subscribers.each do |subscriber| 
      google.add_member_to_group subscriber, group_id
    end
=begin
    owners_arr.each do |owner| 
      google.add_member_to_group owner, group_id # make sure is a member before is an owner
      google.add_owner_to_group owner, group_id
    end
=end
  end

  def owners
    self.owners_raw.split
  end
  def owners= o
    self.owners_raw = o.join "\n"
  end

  def subscribers
    self.subscribers_raw.split
  end

  def subscribers= s
    self.subscribers_raw = s.join "\n"
  end

end
