class BooksController < ApplicationController
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully upadate"
      redirect_to book_path(@book)
    else
      
      render :edit
    end
  end

  def index
    @books = Book.all
    
    @book = Book.new
  end

  def new
    # ビューに渡すインスタンス変数にからのモデルオブジェクトを作成する。
    @book = Book.new
  end
  
  def create
    # データを受け取り、新規登録するためのインスタンスを作成
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books =Book.all
      render :index
    end
  
    # データをデータベースに保存するためのsaveメソッド
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private 
  # ストロングパラメータ
  def book_params
    params.require(:book).permit( :title, :body)
  end
end
