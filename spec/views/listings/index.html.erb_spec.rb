require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        :name => "Name",
        :description => "MyText",
        :price => "9.99"
      ),
      Listing.create!(
        :name => "Name",
        :description => "MyText",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
