require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(email: email,
                               password: password,
                               password_confirmation: password_confirmation,
                               is_admin: is_admin) }

  # 設定 subject 之後, expect(user) 即可簡化成 is_expected.to (將 subject 當成預設用來做測試判斷的物件)

  let(:email) { Faker::Internet.email }
  let(:password) { "12345678" }
  let(:password_confirmation) { "12345678" }
  let(:is_admin) { false }

  it { is_expected.to have_many(:orders) }
  it { is_expected.to validate_presence_of(:email)}

  it "第一個測試" do            # 每一個 it 都代表一個測試的項目
    is_expected.to be_present # expect 是用來對測試下預期的判斷, 執行結果會顯示在 rspec 運作訊息裡
  end

  it "測試 user 建立成功" do
    is_expected.to be_valid   # 等同於 user.valid? == true  , 代表 ActiveModel::Validations pass 而且沒有任何 errors
  end

  context "測試 user 建立失敗" do
    let(:email) { "" } # 如果要修改參數，則可以用 context 來包成一個 block, 來自訂 block 裡的參數值
                       # let 不能用在 it 裡面，這是 rspec 的設計規範
    it { is_expected.to be_invalid }
    it { expect(user.errors).to include(:email) } # 驗證是否為 email 的錯誤
  end

  context "password 跟 password_confirmation 必須要相同" do
    let(:password_confirmation) { "7890" }

    # it { binding.pry }  # <== 如果要用 pry 下中斷點，記得要先宣告 it, 不然會發現無法下 expect 測判斷
    it { is_expected.to be_invalid }
    it { expect(user.errors).to include(:password_confirmation) }
  end

=begin
對於 mehtod 測試，為了讓測試碼好讀，建議如下
用 describe/context 來設一個測 method 的 block
如果是 instace method, 用 '#' 做開頭
如果是 class   method(包括 scope), 用 '::' 做開頭
=end

  describe "#admin?" do
    it { expect(user.admin?).to eq false } # 預設為 false
    it { expect(user.admin?).to eq user.is_admin }

    context "建立 admin user" do
      let(:is_admin) { true }

      it { expect(user.admin?).to eq true }
      it { expect(user.admin?).to eq user.is_admin }
    end
  end

  describe "#to_admin_user!"
  describe "#to_normal_user!"
end
