class Period < ActiveRecord::Base
  has_many :performances
  accepts_nested_attributes_for :performances
end
