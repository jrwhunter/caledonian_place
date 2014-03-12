require 'spec_helper'

describe "meetings/edit" do
  before(:each) do
    @meeting = assign(:meeting, stub_model(Meeting,
      :venue => "MyString",
      :title => "MyString",
      :author => "MyString"
    ))
  end

  it "renders the edit meeting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => meetings_path(@meeting), :method => "post" do
      assert_select "input#meeting_venue", :name => "meeting[venue]"
      assert_select "input#meeting_title", :name => "meeting[title]"
      assert_select "input#meeting_author", :name => "meeting[author]"
    end
  end
end
