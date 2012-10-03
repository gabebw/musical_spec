require 'spec_helper'
require 'stringio'

describe MusicalSpec::Formatter do
  it 'is a ProgressFormatter' do
    formatter = MusicalSpec::Formatter.new('C4')
    formatter.should be_a RSpec::Core::Formatters::ProgressFormatter
  end

  it 'plays a higher-pitched sound when an example passes' do
    formatter = formatter_with_note('E4')
    formatter.example_passed(example)
    formatter.player.should have_played('F4').once
  end

  it 'plays a lower-pitched sound when an example fails' do
    formatter = formatter_with_note('E4')
    formatter.example_failed(example)
    formatter.player.should have_played('D4').once
  end

  it 'does not change the note when an example is pending' do
    formatter = formatter_with_note('E4')
    formatter.example_pending(example)
    formatter.player.should have_played('E4').once
  end

  def formatter_with_note(note)
    MusicalSpec::Formatter.new(StringIO.new, note).tap do |formatter|
      formatter.player.stubs(:play)
    end
  end

  def have_played(note_string)
    note = MusicalSpec::Note.new(note_string)
    have_received(:play).with(equals(note))
  end

  def example
    RSpec::Core::ExampleGroup.describe.example
  end
end
