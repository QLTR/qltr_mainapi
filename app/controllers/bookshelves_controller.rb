class BookshelvesController < ApplicationController

  before_action :set_bookshelf, only: [:show, :update, :destroy]

  # GET /bookshelves
  def index
    @bookshelves = Bookshelf.all
    json_response(@bookshelves)
  end

  # POST /bookshelves
  def create
    @bookshelf = Bookshelf.create!
    json_response(@bookshelf, :created)
  end

  # GET /bookshelves/:id
  def show
    json_response(@bookshelf)
  end

  # PUT /bookshelves/:id
  def update
    # @bookshelf.update(bookshelf_params)
    json_response(@bookshelf)
  end

  # DELETE /bookshelves/:id
  def destroy
    @bookshelf.destroy
    head :no_content
  end

  private

  # def bookshelf_params
  #   # whitelist params
  #   params.permit(...)
  # end

  def set_bookshelf
    @bookshelf = Bookshelf.find(params[:id])
  end
end
