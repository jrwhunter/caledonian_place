require 'spec_helper'

describe "meetings/index" do
  before(:each) do
    assign(:meetings, [
      stub_model(Meeting,
        :venue => "Venue",
        :title => "Title",
        :author => "Author"
      ),
      stub_model(Meeting,
        :venue => "Venue",
        :title => "Title",
        :author => "Author"
      )
    ])
  end

  it "renders a list of meetings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Venue".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
  end
end
