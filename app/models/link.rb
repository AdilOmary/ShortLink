class Link < ApplicationRecord
  validates_presence_of :lookup_code, :original_url
  validates :lookup_code, :original_url, presence: true
  validates :lookup_code, uniqueness: true
end
