require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { create(:wiki, user: user) }
  let(:user) { create(:user) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:user) }

  describe "attributes" do
     it "has title, body and user attributes" do
       expect(wiki).to have_attributes(title: wiki.title, body: wiki.body, user: user)
     end
  end
end
