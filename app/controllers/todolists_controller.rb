class TodolistsController < ApplicationController
  def new
    @list = List.new
    # 投稿用の空の箱を作っているため、DefCreste部分でListと表示している。
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行。List.newから作成されたデータをlistへ渡す。
    list.save
    # ３. トップ画面へリダイレクト
    redirect_to '/top'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
