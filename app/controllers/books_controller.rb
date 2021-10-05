class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def create
     @book=Book.new(book_params)
     @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book.id),notice: 'You have created book successfully,'
    else
      @user=current_user
      @books=Book.all
     render :index
    end
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id),notice:"You have updated user successfully"
    else
    render :edit
    end
  end

  def index
    @users=User.all
    @user=current_user
    @book=Book.new
    @books=Book.all

  end

  def show
    @books=Book.all
    @users=User.all
    @new=Book.new
    @book=Book.find(params[:id])
    @user=@book.user
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end