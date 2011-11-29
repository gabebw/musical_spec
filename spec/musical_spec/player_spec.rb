require 'spec_helper'

describe MusicalSpec::Player do
  before do
    @real_bloopsaphone = MusicalSpec::ONE_TRUE_BLOOPSAPHONE
    MusicalSpec::ONE_TRUE_BLOOPSAPHONE = fake_bloopsaphone
  end

  after { MusicalSpec::ONE_TRUE_BLOOPSAPHONE = @real_bloopsaphone }

  it 'sets the correct note' do
    subject.play(MusicalSpec::Note.new('C4'))
    fake_bloopsaphone.should have_received(:tune).with(fake_sound, 'C4')
  end

  it 'clears tunes before playing' do
    subject.play(MusicalSpec::Note.new('C4'))
    fake_bloopsaphone.should have_received(:clear).once
  end

  it 'plays the tune' do
    subject.play(MusicalSpec::Note.new('C4'))
    fake_bloopsaphone.should have_received(:play).once
  end

  let(:fake_sound) { stub("Bloopsaphone sound", :sustain= => nil) }
  let(:fake_bloopsaphone) do
    stub('Fake Bloopsaphone',
         :tune  => nil,
         :tempo= => nil,
         :play  => nil,
         :clear => nil,
         :stopped? => true,
         :sound => fake_sound)
  end
end
