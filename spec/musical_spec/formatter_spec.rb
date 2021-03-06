require 'spec_helper'
require 'stringio'

describe MusicalSpec::Formatter do
  it 'is a ProgressFormatter' do
    formatter = MusicalSpec::Formatter.new('C4')
    expect(formatter).to be_a RSpec::Core::Formatters::ProgressFormatter
  end

  it 'tells RSpec that it can handle passed/failed/pending specs' do
    registered_formatters = RSpec::Core::Formatters::Loader.formatters

    expect(registered_formatters[MusicalSpec::Formatter]).to eq [
      :example_passed,
      :example_failed,
      :example_pending
    ]
  end

  it 'plays a higher-pitched sound when an example passes' do
    formatter = formatter_with_note('E4')
    formatter.example_passed(example)
    expect(formatter.player).to have_played('F4').once
  end

  it 'plays a lower-pitched sound when an example fails' do
    formatter = formatter_with_note('E4')
    formatter.example_failed(example)
    expect(formatter.player).to have_played('D4').once
  end

  it 'does not change the note when an example is pending' do
    formatter = formatter_with_note('E4')
    formatter.example_pending(example)
    expect(formatter.player).to have_played('E4').once
  end

  def formatter_with_note(note)
    MusicalSpec::Formatter.new(StringIO.new, note).tap do |formatter|
      allow(formatter.player).to receive(:play)
    end
  end

  def have_played(note_string)
    note = MusicalSpec::Note.new(note_string)
    have_received(:play).with(note)
  end

  def example
    RSpec::Core::ExampleGroup.describe.example
  end
end
