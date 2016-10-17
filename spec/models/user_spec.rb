require 'rails_helper'

RSpec.describe User, type: :model do
  it "第一個測試" do            # 每一個 it 都代表一個測試的項目
    expect(User).to be_present # expect 是用來對測試下預期的判斷, 執行結果會顯示在 rspec 運作訊息裡
  end

  it "測試 user 建立成功" do
    user = User.create(email: "user@test.com",
                       password: "12345678",
                       password_confirmation: "12345678")
    expect(user).to be_valid   # 等同於 user.valid? == true  , 代表 ActiveModel::Validations pass 而且沒有任何 errors
  end
end
