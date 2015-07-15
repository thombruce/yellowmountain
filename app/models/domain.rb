class Domain < ActiveRecord::Base
  resourcify
  belongs_to :owner, polymorphic: true
  has_many :mailboxes, :dependent => :destroy

  validates :owner_id, :presence => true

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  def slug_candidates
    name + extension
  end
  def should_generate_new_friendly_id?
    slug.blank?
  end

  def full
    name + extension
  end


  def normalize_friendly_id(string)
    string
  end

  def global_owner
    self.owner.to_global_id if self.owner.present?
  end

  def global_owner=(owner)
    self.owner = GlobalID::Locator.locate owner
  end


end
