require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      :name => "MyString",
      :description => "MyText",
      :price => "9.99"
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input#listing_name[name=?]", "listing[name]"

      assert_select "textarea#listing_description[name=?]", "listing[description]"

      assert_select "input#listing_price[name=?]", "listing[price]"
    end
  end
end
