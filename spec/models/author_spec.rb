require 'spec_helper'

describe Author do
  it { should have_many(:stories) }
  it { should have_many(:sentences) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should allow_value("5555555555").for(:phone) }
  it { should allow_value("(555) 555-5555").for(:phone) }
  it { should allow_value("555-555-5555").for(:phone) }
  it { should_not allow_value("5").for(:phone) }
  it { should_not allow_value("4569709897086754563678978674577").for(:phone) }

  it "returns full name" do
    author = FactoryGirl.build(:author, first_name: 'Bob', last_name: 'Loblaw')
    author.name.should eq('Bob Loblaw')
  end

  it "returns proper name" do
    author = FactoryGirl.build(:author, first_name: 'Bob', last_name: 'Loblaw')
    author.proper_name.should eq('Loblaw, Bob')
  end
end
