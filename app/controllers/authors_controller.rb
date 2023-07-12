class AuthorsController < ApplicationController
  def index
    @authors = Author.paginate(page: params[:page], per_page: 10)
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end

end
