class Organization < ActiveRecord::Base
  include HumanizeName
  resourcify
  belongs_to :user
  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'

  has_many :domains, :as => :owner, :dependent => :destroy

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  def slug_candidates
    [
      :name
    ]
  end
  def should_generate_new_friendly_id?
    slug.blank?
  end

end
