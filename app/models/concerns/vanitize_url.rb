module VanitizeUrl
  extend ActiveSupport::Concern

  included do
    after_save :vanitize_url
    delegate :url_helpers, to: "Rails.application.routes"
    # alias :h :url_helpers
    has_one :vanity_url, :as => :owner, :dependent => :destroy
  end

  def path
    url_helpers.send :"#{self.class.name.underscore}_path", self.slug
    # h.send :"#{self.class.name.underscore}_path", self.slug
    # Why alias when the original is clearer?
  end

  def vanitize_url
    if self.vanity_url
      self.vanity_url.update_attributes(:slug => self.slug, :target => self.path)
    else
      self.create_vanity_url(:slug => self.slug, :target => self.path)
    end
  end
end
