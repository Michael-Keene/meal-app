class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def edible?
    self.class.edible?
  end

  def self.edible?
    included_modules.include? Edible
  end
end
