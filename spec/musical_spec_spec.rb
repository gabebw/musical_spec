require 'spec_helper'

describe MusicalSpec::ONE_TRUE_BLOOPSAPHONE do
  it "is a Bloopsaphone singleton because of thread wackiness" do
    MusicalSpec::ONE_TRUE_BLOOPSAPHONE.should be_a Bloops
  end
end
