class Organization < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'

  has_many :domains, :as => :owner, :dependent => :destroy
end
