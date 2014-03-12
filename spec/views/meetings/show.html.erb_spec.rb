require 'spec_helper'

describe "meetings/show" do
  before(:each) do
    @meeting = assign(:meeting, stub_model(Meeting,
      :venue => "Venue",
      :title => "Title",
      :author => "Author"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Venue/)
    rendered.should match(/Title/)
    rendered.should match(/Author/)
  end
end
