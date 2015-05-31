require 'rails_helper'

describe Period, type: :model do
  it { is_expected.to have_many :performances }
end