class BooksController < ApplicationController

  before_action :set_bookshelf
  before_action :set_bookshelf_book, only: [:show, :update, :destroy]


  # GET /bookshelves/:id/books
  def index
    json_response(@bookshelf.books)
  end

  # POST /bookshelves/:id/books
  def create
    book = @bookshelf.books.create!(book_params)
    json_response(book, :created)
  end

  # GET /bookshelves/:bookshelf_id/books/:id
  def show
    json_response(@book)
  end

  # PUT /bookshelves/:bookshelf_id/books/:id
  def update
    @book.update(book_params)
    json_response(@book)
  end

  # DELETE /bookshelves/:bookshelf_id/books/:id
  def destroy
    @book.destroy
    head :no_content
  end

  private

  def book_params
    # whitelist params
    params.permit(:title)
  end

  def set_bookshelf
    @bookshelf = Bookshelf.find(params[:bookshelf_id])
  end

  def set_bookshelf_book
    @book = @bookshelf.books.find(params[:id]) if @bookshelf
  end
end
