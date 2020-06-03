class Book < ApplicationRecord
    belongs_to :bookshelf, required: true
    validates :title, presence: true
end
