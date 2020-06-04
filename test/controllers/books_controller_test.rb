require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookshelf = bookshelves(:one)
  end

  test "index /bookshelves/:bookshelf_id/books/:id" do
    get base_url + '/books' 
    assert_equal @bookshelf.books.count, json.size
  end

  test "show /bookshelves/:id" do
    book = @bookshelf.books.first
    get base_url + "/books/#{book.id}" 
    assert_equal book.as_json["id"], json["id"]
    assert_equal book.as_json["title"], json["title"]
  end

  test "create /bookshelves/:id/books ok" do
    hash = {title: 'Donjon tome 2'}
    assert_difference "Book.count", 1 do
      post base_url + "/books", params: hash
      assert_not json["id"].nil?
      assert_equal hash[:title], json["title"]
    end
  end

  # test "create /bookshelves/:id/books nok" do
  #   hash = {}
  #   post base_url + "/books", params: hash
  #   # TODO
  # end

  test "put /bookshelves/:bookshelf_id/books/:id ok" do
    book = @bookshelf.books.first
    hash = {title: 'Toti'}
    put base_url + "/books/#{book.id}", params: hash
    assert_equal book.id, json["id"]
    assert_equal hash[:title], json["title"]
  end

  # test "put /bookshelves/:bookshelf_id/books/:id nok" do
  #   hash = {}
  #   post base_url + "/books", params: hash
  #   # TODO
  # end

  test "destroy /bookshelves/:bookshelf_id/books/:id ok" do
    book = @bookshelf.books.first
    assert_difference "Book.count", -1 do
      delete base_url + "/books/#{book.id}"
    end
  end

  private

  def base_url
    "/bookshelves/#{@bookshelf.id}"
  end
end
