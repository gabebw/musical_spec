require 'spec_helper'

describe MusicalSpec::ONE_TRUE_BLOOPSAPHONE do
  it "is a Bloopsaphone singleton because of thread wackiness" do
    expect(MusicalSpec::ONE_TRUE_BLOOPSAPHONE).to be_a Bloops
  end
end
