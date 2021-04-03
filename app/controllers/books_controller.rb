class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    # 以下デバッグ問２２　追記
    @user = @book.user
    @new_book = Book.new
    #以上デバッグ
  end

# 以下デバッグ問１７　追記
  def index
    @book = Book.new
    @books = Book.all
  end
# 以上デバッグ
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # 以下デバッグ問１９　追記
    @book.save
    # 以上デバッグ
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    # 以下デバッグ問２９追記
    if current_user != @book.user
      redirect_to books_path
    end

    @user = User.find(@book.user_id)
    # 以上デバッグ
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

# 以下デバッグ
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
# 以上デバッグ

  private

  def book_params
    # 以下デバッグ問１９追記
    params.require(:book).permit(:title,:body,:user_id)
    # params.require(:book).permit(:title)
    # 以上デバッグ
  end

end
