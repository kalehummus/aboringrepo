class BooksController < ApplicationController
  require 'uri'

  def index
    @query = params[:q]
    if @query
      @books = search_by_title(@query)
    end
  end

  def make_url(search)
    "https://www.googleapis.com/books/v1/volumes?q=" + URI.escape(search.to_s)
  end

  def search_by_title(query)
    url = make_url(query)
    response = HTTParty.get(url)
    if response["items"].present?
      response["items"].map { |item| item["volumeInfo"] }
    else
      []
    end
  end
end
