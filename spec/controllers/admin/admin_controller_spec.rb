require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  it { is_expected.to use_before_action(:authenticate_user!) }
  it { is_expected.to use_before_action(:admin_required) }
end
