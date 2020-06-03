require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "creates ok" do
    bs = bookshelves(:one)
    b = Book.new(bookshelf: bs, title: 'Toto')
    assert b.save
  end

  test "validates title and bookshelf on create" do
    bs = bookshelves(:one)
    b = Book.new bookshelf: bs
    assert_not b.save

    b.bookshelf = nil
    b.title = 'Toto'
    assert_not b.save
  end

  test "finds ok" do
    b = books(:one)
    assert Book.find b.id
  end

  test "belongs_to bookshelf" do
    bs = books(:one)
    assert bs.respond_to?(:bookshelf)
  end
end
