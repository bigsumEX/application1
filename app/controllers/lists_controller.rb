class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end
  
  def create
    #1,2 :フォームに書かれたデータを受け取り新規登録するためのインスタンス
    list = List.new(list_params)
    #3 :データをデータベースに格納するためのsaveメソッド実行
    list.save
    #4 :トップ画面へリダイレクト
    redirect_to list_path(list.id)
  end
  
  def index
    #一覧画面用のアクション
    @lists = List.all
    #テーブルに保存されたデータを全取得する。
  end
  
  def show
    @list = List.find(params[:id]) #urlが../lists/2 => id =2
  end

  def edit
  end
  
  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
    #データの絞り込み
  end
end
