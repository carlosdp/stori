require 'spec_helper'

describe Sentence do
  it { should belong_to(:author) }
  it { should belong_to(:story) }

  it { should allow_value(5).for(:length) }
  it { should allow_value(5.5).for(:length) }
  it { should_not allow_value(0).for(:length) }
  it { should_not allow_value(-1).for(:length) }
  it { should allow_value(nil).for(:length) }
end
