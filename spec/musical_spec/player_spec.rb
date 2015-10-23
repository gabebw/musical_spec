require 'spec_helper'

describe MusicalSpec::Player do
  it 'sets the correct note' do
    bloopsaphone_mock = build_bloopsaphone_mock
    sound = bloopsaphone_mock.sound
    with_one_true_bloopsaphone(bloopsaphone_mock) do
      subject.play(MusicalSpec::Note.new('C4'))
      expect(bloopsaphone_mock).to have_received(:tune).with(sound, 'C4')
    end
  end

  it 'clears tunes before playing' do
    bloopsaphone_mock = build_bloopsaphone_mock
    with_one_true_bloopsaphone(bloopsaphone_mock) do
      subject.play(MusicalSpec::Note.new('C4'))
      expect(bloopsaphone_mock).to have_received(:clear).once
    end
  end

  it 'plays the tune' do
    bloopsaphone_mock = build_bloopsaphone_mock
    with_one_true_bloopsaphone(bloopsaphone_mock) do
      subject.play(MusicalSpec::Note.new('C4'))
      expect(bloopsaphone_mock).to have_received(:play).once
    end
  end

  def fake_sound
    stub("Bloopsaphone sound", :sustain=)
  end

  def build_bloopsaphone_mock
    stub('Fake Bloopsaphone',
         :tune  => nil,
         :tempo= => nil,
         :play  => nil,
         :clear => nil,
         :stopped? => true,
         :sound => fake_sound)
  end

  def with_one_true_bloopsaphone(new_bloopsaphone)
    real_bloopsaphone = MusicalSpec::ONE_TRUE_BLOOPSAPHONE
    MusicalSpec.send(:remove_const, :ONE_TRUE_BLOOPSAPHONE)
    MusicalSpec.const_set(:ONE_TRUE_BLOOPSAPHONE, new_bloopsaphone)
    begin
      yield
    ensure
      MusicalSpec.send(:remove_const, :ONE_TRUE_BLOOPSAPHONE)
      MusicalSpec.const_set(:ONE_TRUE_BLOOPSAPHONE, real_bloopsaphone)
    end
  end
end
