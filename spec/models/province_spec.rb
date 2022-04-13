require 'rails_helper'

RSpec.describe Province, type: :model do
  it { should belong_to(:region) }
end
