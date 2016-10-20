require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  subject(:admin_user) { User.create(email: "admin@test.com", password: "12345678", password_confirmation: "12345678", is_admin: true) }
  subject(:normal_user){ User.create(email: "user@test.com", password: "12345678", password_confirmation: "12345678") }
  subject(:product)    { Product.create(title: "macbook", price: "60000", quantity: "5", description: "蘋果電腦")}

  describe "GET index" do
    context "login admin_user" do
      before { sign_in :user, admin_user }
      before { get :index }

      it { expect(response).to be_success }
      it { expect(response.header['Content-Type']).to include "text/html" }
    end

    context "login normal_user" do
      before { sign_in :user, normal_user }
      before { get :index }

      it { expect(response).to redirect_to root_path }
    end

    context "login admin_user with json" do
      before { sign_in :user, admin_user }
      before { get :index, format: :json }

      it { expect(response).to be_success }
      it { expect(response.header['Content-Type']).to include "application/json" }
    end

    context "login normal_user with json" do
      before { sign_in :user, normal_user }
      before { get :index, format: :json }

      it { expect(response).to redirect_to root_path }
    end
  end

  describe "GET new" do
    context "login admin_user" do
      before { sign_in :user, admin_user }
      before { get :new }

      it { expect(response).to be_success }
      it { expect(response.header['Content-Type']).to include "text/html" }
    end

    context "login normal_user" do
      before { sign_in :user, normal_user }
      before { get :new }

      it { expect(response).to redirect_to root_path }
    end
  end

  describe "GET edit"

  describe "POST create"

  describe "PUT/PATCH update"
end
