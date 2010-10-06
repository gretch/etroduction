class Category < ActiveRecord::Base

  has_many :contents

  before_save :assign_shortname

  def self.find_by_param(param)
    find(:first, :conditions => {:shortname => param}, :include => [:contents])
  end

  def to_param
    shortname
  end

  protected

    def assign_shortname
      self.shortname = if self.title.blank?
        ''
      else
        self.shortname = to_safe_url(self.title)
      end
    end

  def to_safe_url(str)
    # taken from friendly ID
    return "" if str.blank?
    ActiveSupport::Multibyte.proxy_class.new(str).normalize(:kc).
      # For some reason Spanish ¡ and ¿ are not detected as non-word
      # characters. Bug in Ruby?
      gsub(/[\W|¡|¿]/u, ' ').
      strip.
      gsub(/\s+/u, '-').
      gsub(/-\z/u, '').
      downcase.
      to_s
  end
end
