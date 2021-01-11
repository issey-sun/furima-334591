require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
end

  describe '購入' do
    context '購入がうまくいくとき' do
      it "内容に問題ない場合" do
        expect(@order).to be_valid
      end
      
    context '購入がうまくいかないとき' do
      it "郵便番号が入力されていないとき" do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank", "Post code Input correctly")
      end
     it "郵便番号が空白で入力されたとき" do
        @order.post_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号に-が抜けているとき" do
        @order.post_code = "12345678"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code Input correctly")
      end
      it "郵便番号に全角が入っているとき" do
        @order.post_code = "123-あ456"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code Input correctly")
      end
      it "都道府県が入力されていないとき" do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank.")
      end
     it "都道府県が--で入力された時" do
        @order.prefecture_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank.")
      end
      it "市長区村が入力されていないとき" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank", "City is invalid. Input full-width characters.")
      end
     it "市長区村が空白で入力された時" do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank", "City is invalid. Input full-width characters.")
      end
      it "番地が入力されていないとき" do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
     it "番地が空白で入力された時" do
        @order.house_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が入力されていないとき" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid.")
      end
     it "電話番号が空白で入力されたとき" do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid.")
      end
      it "電話番号が全角で入力されたとき" do
        @order.phone_number = "０９０１２３４５６７８"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid.")
      end
      it "電話番号が12桁以上で入力されたとき" do
        @order.phone_number = "000000000000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid.")
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

       end
     end
   end
 end
