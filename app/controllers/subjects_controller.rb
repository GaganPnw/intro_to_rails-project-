class SubjectsController < ApplicationController
  def index
    @subjects = Subject.paginate(page: params[:page], per_page: 10)
  end
  def show
    @subject = Subject.find(params[:id])
    @books = @subject.books
  end

  def books
    @subject = Subject.find(params[:id])
    @books = @subject.books

    respond_to do |format|
      format.html {
        # Render HTML template
      }
      format.json {
        render json: @books
      }
    end
  end



end
