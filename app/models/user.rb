class User < ActiveRecord::Base
  include VanitizeUrl
  rolify
  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blog_posts, :dependent => :destroy

  def should_generate_new_friendly_id?
    slug.blank? || username_changed?
  end

  private

end
