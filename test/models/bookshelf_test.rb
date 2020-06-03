require 'test_helper'

class BookshelfTest < ActiveSupport::TestCase
  test "creates ok" do
    bs = Bookshelf.new
    assert bs.save
  end

  test "finds ok" do
    bs = bookshelves(:one)
    assert Bookshelf.find bs.id
  end

  test "has_many books" do
    bs = bookshelves(:one)
    assert bs.respond_to?(:books)
  end
end
