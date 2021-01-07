require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "内容に問題ない場合" do
        expect(@item).to be_valid
      end
      
    context '商品出品がうまくいかないとき' do
      it "画像がないとき" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないとき" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明欄に記述がないとき" do
        @item.introduce = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduce can't be blank")
      end
      it "カテゴリーが--が選択されているとき" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリーが1を選択されているとき" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が--が選択されているとき" do
        @item.item_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it "商品の状態が1を選択されているとき" do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition must be other than 1")
      end
      it "配送料の負担が--が選択されているとき" do
        @item.postage_payer_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it "配送料の負担が1を選択されているとき" do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer must be other than 1")
      end
      it "発送元の地域が--が選択されているとき" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送元の地域が1を選択されているとき" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "発送までの日数が--が選択されているとき" do
        @item.preparation_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end
      it "発送までの日数が1を選択されているとき" do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day must be other than 1")
      end
      it "販売価格が入力されていないとき" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end
      it "販売価格が数字以外で入力されているとき" do
        @item.price = "ああaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "販売価格が300円より低いとき" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が9,999,999円より高いとき" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
       end
     end
   end
 end

