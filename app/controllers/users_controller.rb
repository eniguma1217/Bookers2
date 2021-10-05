class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=@user.books.page(params[:page])
  end

  def edit
    @user=User.find(params[:id])
    #if params[:id].to_i != current_user.id
    if @user.id != current_user.id
       redirect_to user_path(current_user)
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice:"You have updated user successfully"
    else
    render :edit
    end
  end

  def index
    @users=User.all
    @user=current_user
    @book=Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end
