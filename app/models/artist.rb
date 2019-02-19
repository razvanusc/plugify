class Artist < ApplicationRecord
  has_many :requests, dependent: :destroy
end
