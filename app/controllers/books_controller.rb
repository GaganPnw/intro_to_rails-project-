class BooksController < ApplicationController
  def index
    if params[:search].present? && params[:subject].present?
      @books = Book.joins(:subjects).where("books.title LIKE ? AND subjects.id = ?", "%#{params[:search]}%", params[:subject]).paginate(page: params[:page], per_page: 10)
    elsif params[:search].present? && params[:subject].blank?
      @books = Book.where("title LIKE ?", "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
    elsif params[:subject].present?
      @books = Subject.find(params[:subject]).books.paginate(page: params[:page], per_page: 10)
    else
      @books = Book.paginate(page: params[:page], per_page: 10)
    end

    @subjects = Subject.all

    # Display a message when the search query is blank
    @search_query = params[:search] || ""
    @no_query_message = "Please enter a search query" if @search_query.blank?
  end



  def show
    @book = Book.find(params[:id])
  end

end
