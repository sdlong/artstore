require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(email: email,
                               password: password,
                               password_confirmation: password_confirmation) }

  # 設定 subject 之後, expect(user) 即可簡化成 is_expected.to (將 subject 當成預設用來做測試判斷的物件)

  let(:email) { "user@test.com" }
  let(:password) { "12345678" }
  let(:password_confirmation) { "12345678" }

  it "第一個測試" do            # 每一個 it 都代表一個測試的項目
    is_expected.to be_present # expect 是用來對測試下預期的判斷, 執行結果會顯示在 rspec 運作訊息裡
  end

  it "測試 user 建立成功" do
    is_expected.to be_valid   # 等同於 user.valid? == true  , 代表 ActiveModel::Validations pass 而且沒有任何 errors
  end

  it "測試 user 建立失敗" do
    user = User.create(email: "",
                       password: "12345678",
                       password_confirmation: "12345678")
    expect(user).to be_invalid
  end
end
