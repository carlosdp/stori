require 'spec_helper'

describe Story do
  it { should belong_to(:author) }
  it { should have_many(:sentences) }

  it { should validate_presence_of(:title) }
end
