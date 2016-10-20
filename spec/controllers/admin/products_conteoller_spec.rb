require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  subject(:admin_user) { User.create(email: "admin@test.com", password: "12345678", password_confirmation: "12345678", is_admin: true) }
  subject(:normal_user){ User.create(email: "user@test.com", password: "12345678", password_confirmation: "12345678") }
  subject(:product)    { Product.create(title: "macbook", price: "60000", quantity: "5", description: "蘋果電腦")}

  describe "GET index"

  describe "GET new"

  describe "GET edit"

  describe "POST create"

  describe "PUT/PATCH update"
end
