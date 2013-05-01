require "spec_helper"

describe "Auto Owner" do
  before(:each) do
    @owner = User.create!(:name => "TestUser")
    @location = Location.new()
  end

  after(:each) do
    @location.destroy
    @owner.destroy
  end

  it "should set the owner correct" do

    # we set the tag owner
    @location.tag_owner = @owner

    # generate the skill list
    @location.skill_list = "Dance,Read"
    @location.save!

    # check if the skills are there
    @location.skill_list.should eql("Dance,Read")

    # check if the owner got's the tags as well
    @owner.owned_taggings.count.should eql(2)
  end

end