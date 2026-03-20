class ItemsController < ApplicationController
  # 商品一覧を返す（画像URL付き）
  def index
    # with_attached_image をつけると、画像データをまとめて取得して動作が速くなります
    @items = Item.all.with_attached_image
    
    render json: @items.map { |item|
      item.as_json.merge(
        # Next.js側で使うための image_url を追加
        image_url: item.image.attached? ? url_for(item.image) : nil
      )
    }
  end

  # 新しい商品を保存する（画像も一緒に保存）
  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # 商品を削除する
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    render json: { message: "削除しました" }
  end

  private

  # セキュリティのための設定
  def item_params
    # :image を許可リスト（permit）に忘れずに追加！
    params.require(:item).permit(:name, :price, :description, :image)
  end
end