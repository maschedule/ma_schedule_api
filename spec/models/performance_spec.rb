require 'rails_helper'

describe Performance, type: :model do
  it { is_expected.to belong_to :period }
end