class Mailbox < ActiveRecord::Base
  belongs_to :domain

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  def slug_candidates
    username + "@" + domain.full
  end
  def should_generate_new_friendly_id?
    slug.blank? || username_changed?
  end

  def address
    username + "@" + domain.full
  end


  def normalize_friendly_id(string)
    string
  end
end
