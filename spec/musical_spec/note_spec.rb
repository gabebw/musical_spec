require 'spec_helper'

describe MusicalSpec::Note do
  it 'defaults to the lowest note' do
    expect(subject.to_s).to eq(MusicalSpec::LOWEST_NOTE.to_s)
  end

  it 'can be initialized with a note' do
    expect(MusicalSpec::Note.new('E4').to_s).to eq('E4')
  end

  it 'does not go higher than B6' do
    subject.note = 'B6'
    subject.higher!
    expect(subject.to_s).to eq('B6')
  end

  it 'does not go lower than C2' do
    subject.note = 'C2'
    subject.lower!
    expect(subject.to_s).to eq('C2')
  end

  it 'allows setting the note' do
    subject.note = 'A4'
    expect(subject.to_s).to eq('A4')
  end

  context '#higher!' do
    it 'increases the note by 1' do
      subject.note = 'C4'
      subject.higher!
      expect(subject.to_s).to eq('D4')
    end

    it 'changes octaves when moving from B to C' do
      subject.note = 'B4'
      subject.higher!
      expect(subject.to_s).to eq('C5')
    end

    it 'does not change octaves when moving from G to A' do
      subject.note = 'G4'
      subject.higher!
      expect(subject.to_s).to eq('A4')
    end
  end

  context '#lower!' do
    it 'decreases the note by 1' do
      subject.note = 'E4'
      subject.lower!
      expect(subject.to_s).to eq('D4')
    end

    it 'changes octaves when moving from C to B' do
      subject.note = 'C4'
      subject.lower!
      expect(subject.to_s).to eq('B3')
    end

    it 'does not change octaves when moving from A to G' do
      subject.note = 'A4'
      subject.lower!
      expect(subject.to_s).to eq('G4')
    end
  end

  context '<=>' do
    it 'knows that D4 < E4' do
      expect(d4).to be < e4
    end

    it 'knows that E4 > D4' do
      expect(e4).to be > d4
    end

    it 'knows that C4 > B3' do
      expect(c4).to be > b3
    end

    it 'knows that B3 < C4' do
      expect(b3).to be < c4
    end

    it 'knows that A4 > G4' do
      expect(a4).to be > g4
    end

    it 'knows that A4 == A4' do
      expect(a4).to eq(a4)
    end

    it 'knows that G4 < A4' do
      expect(g4).to be < a4
    end

    let(:d4) { MusicalSpec::Note.new('D4') }
    let(:e4) { MusicalSpec::Note.new('E4') }

    let(:c4) { MusicalSpec::Note.new('C4') }
    let(:b3) { MusicalSpec::Note.new('B3') }

    let(:a4) { MusicalSpec::Note.new('A4') }
    let(:g4) { MusicalSpec::Note.new('G4') }
  end
end
