class Opportunity < ActiveRecord::Base

  acts_as_commentable

  belongs_to :category

  belongs_to :user

  named_scope :recent, :order => "created_at DESC", :include => [:comments]
  named_scope :limit, lambda { |limit| {:limit => limit} }

  def self.find_by_param(param)
    find(:first, :conditions => {:shortname => param}, :include => [:comments])
  end

  def published!
    self.update_attribute(:published, true)
  end

  def unpublished!
    self.update_attribute(:published, false)
  end

  protected

end
