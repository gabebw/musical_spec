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
    formatter.player.should have_played_f4_once
  end

  it 'plays a lower-pitched sound when an example fails' do
    formatter = formatter_with_note('E4')
    formatter.example_failed(example)
    formatter.player.should have_played_d4_once
  end

  it 'does not change the note when an example is pending' do
    formatter = formatter_with_note('E4')
    formatter.example_pending(example)
    formatter.player.should have_played_e4_once
  end

  def example
    RSpec::Core::ExampleGroup.describe.example
  end

  def formatter_with_note(note)
    formatter = MusicalSpec::Formatter.new(StringIO.new, note)
    formatter.player.stubs(:play)

    formatter
  end

  def have_played_f4_once
    have_received(:play).once.with(equals(MusicalSpec::Note.new('F4')))
  end

  def have_played_d4_once
    have_received(:play).once.with(equals(MusicalSpec::Note.new('D4')))
  end

  def have_played_e4_once
    have_received(:play).once.with(equals(MusicalSpec::Note.new('E4')))
  end
end
