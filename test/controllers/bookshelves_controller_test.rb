require 'test_helper'

class BookshelvesControllerTest < ActionDispatch::IntegrationTest
  test "index /bookshelves" do
    get '/bookshelves' 
    assert_equal Bookshelf.count, json.size
  end

  test "show /bookshelves/:id" do
    bookshelf = bookshelves(:one)
    get "/bookshelves/#{bookshelf.id}" 
    assert_equal bookshelf.as_json["id"], json["id"]
  end

  test "create /bookshelves" do
    assert_difference "Bookshelf.count", 1 do
      post '/bookshelves', {}
      assert_not json['id'].nil?
    end
  end

  test "put /bookshelves/:id" do
    bookshelf = bookshelves(:one)
    put "/bookshelves/#{bookshelf.id}"
    assert_equal bookshelf.as_json["id"], json["id"]
  end

  test "destroy /bookshelves/:id" do
    bookshelf = bookshelves(:one)
    assert_difference "Bookshelf.count", -1 do
      delete "/bookshelves/#{bookshelf.id}"
    end
  end
end
