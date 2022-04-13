class Province < ApplicationRecord
  belongs_to :region, foreign_key: :region_id
end
