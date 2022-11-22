class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(parmas[:id])
    @user = @book.user
  end

  def edit
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_usser.id
    @book.save
    redirect_to books_path
  end
  
private
  def book_params
    parmas.require(:book).permit(:title, :body)
  end
end
