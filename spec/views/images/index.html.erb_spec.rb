require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        :url => "Url"
      ),
      Image.create!(
        :url => "Url"
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
