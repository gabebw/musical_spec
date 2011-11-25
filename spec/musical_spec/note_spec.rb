require 'spec_helper'

describe MusicalSpec::Note do
  it 'defaults to middle C' do
    subject.note.should == 'C4'
  end

  it 'sets MAX_OCTAVE to 6' do
    MusicalSpec::Note::MAX_OCTAVE.should == 6
  end

  it 'sets MIN_OCTAVE to 2' do
    MusicalSpec::Note::MIN_OCTAVE.should == 2
  end

  it 'allows setting the note' do
    subject.note = 'A4'
    subject.note.should == 'A4'
  end

  it 'does not let the octave go above MAX_OCTAVE' do
    very_high_octave = MusicalSpec::Note::MAX_OCTAVE + 1
    subject.note = "A#{very_high_octave}"
    subject.note.should == "A#{MusicalSpec::Note::MAX_OCTAVE}"
  end

  it 'does not let the octave go below MIN_OCTAVE' do
    very_low_octave = MusicalSpec::Note::MIN_OCTAVE - 1
    subject.note = "A#{very_low_octave}"
    subject.note.should == "A#{MusicalSpec::Note::MIN_OCTAVE}"
  end

  context '#next!' do
    it 'increases the note by 1' do
      subject.note = 'C4'
      subject.next!
      subject.note.should == 'D4'
    end

    it 'changes octaves when moving from B to C' do
      subject.note = 'B4'
      subject.next!
      subject.note.should == 'C5'
    end

    it 'does not change octaves when moving from G to A' do
      subject.note = 'G4'
      subject.next!
      subject.note.should == 'A4'
    end
  end

  context '#prev!' do
    it 'decreases the note by 1' do
      subject.note = 'E4'
      subject.prev!
      subject.note.should == 'D4'
    end

    it 'changes octaves when moving from C to B' do
      subject.note = 'C4'
      subject.prev!
      subject.note.should == 'B3'
    end

    it 'does not change octaves when moving from A to G' do
      subject.note = 'A4'
      subject.prev!
      subject.note.should == 'G4'
    end
  end
end
