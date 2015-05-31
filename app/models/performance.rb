class Performance < ActiveRecord::Base
  belongs_to :period, dependent: :destroy
end
