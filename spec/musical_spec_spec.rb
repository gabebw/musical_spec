require 'spec_helper'

describe MusicalSpec do
  it "creates a Bloopsaphone singleton because of thread wackiness" do
    MusicalSpec::ONE_TRUE_BLOOPSAPHONE.should be_a Bloops
  end
end
