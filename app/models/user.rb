class User < ActiveRecord::Base

  acts_as_taggable

  validates_uniqueness_of :login

  acts_as_authentic do |c|
    c.merge_validates_format_of_email_field_options(:message => I18n.t('error_messages.email_invalid', :default => "address is invalid."))
    c.merge_validates_uniqueness_of_email_field_options
  end

#  def before_connect(facebook_session)
#    self.name = facebook_session.user.name
#  end

end
