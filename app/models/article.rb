class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
  validates :description, presence: true
end
