class Period < ActiveRecord::Base
  has_many :performances, dependent: :destroy
  accepts_nested_attributes_for :performances
end
