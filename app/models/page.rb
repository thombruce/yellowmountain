class Page < ActiveRecord::Base
  include VanitizeUrl
  default_scope -> { order('pages.created_at DESC') }
  resourcify
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :user

  def slug_candidates
    [
      :slug_candidate, 
      [:title]
    ]
  end
  def should_generate_new_friendly_id?
    slug.blank? || slug_candidate_changed? || title_changed?
  end
end
