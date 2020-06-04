class Bookshelf < ApplicationRecord
    has_many :books, dependent: :destroy
end
