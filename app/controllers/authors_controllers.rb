class AuthorsController < ApplicationController
  def index
    @authors = Author.page(params[:page]).per(10)
  end
end
