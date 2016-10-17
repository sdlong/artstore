require 'rails_helper'

RSpec.describe User, type: :model do
  it "第一個測試" do            # 每一個 it 都代表一個測試的項目
    expect(User).to be_present # expect 是用來對測試下預期的判斷, 執行結果會顯示在 rspec 運作訊息裡
  end
end
