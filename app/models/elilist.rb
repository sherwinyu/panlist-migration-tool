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
    val = self.list_id || self.name
    # dasherize the id
    val.gsub /\s+/, "-"
  end

  def create_google_group
    self.google_group_create
    subscribers.each do |subscriber| 
      self.google_group_add_member subscriber
    end
=begin
    group = google.create_group self.google_group_id, [name, 'just a description', group_type]
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

  def delete_google_group
    Elilist.google_api.delete_group self.google_group_id
  end

  def google_group_add_member email
    Elilist.google_api.add_member_to_group email, self.google_group_id
  end

  def google_group_create
     Elilist.google_api.create_group self.google_group_id, [name, 'just a description', self.google_group_type]
  end

  def self.google_api
    adminuser =  "sherwin.yu@gsbx.yale.edu"
    adminuser =  "sherwin@communificiency.com"
    password  = Plmt::Application.config.google_data_pw
    @google_api ||= ProvisioningApi.new(adminuser, password)
  end

end
