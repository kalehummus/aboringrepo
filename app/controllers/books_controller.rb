
class BooksController < ApplicationController

  require 'uri'

  def searchbook
      @book = params[:book]
      if @book
        my_search = make_url(@book)
        search_by_title(my_search)
      end
    end

  def make_url(search)
    # p search
    searchparams = URI.escape(search.to_s)
    search_url = "https://www.googleapis.com/books/v1/volumes?q=" + searchparams
    @get_search = search_url
  end

  def search_by_title(url)
    response = HTTParty.get(url)
    @books = response["items"]
  end



end
