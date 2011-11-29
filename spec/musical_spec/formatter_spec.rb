require 'spec_helper'
require 'stringio'

describe MusicalSpec::Formatter do
  it { should be_a RSpec::Core::Formatters::ProgressFormatter }

  it 'plays a higher-pitched sound when an example passes' do
    formatter = formatter_with_note('E4')
    formatter.example_passed(example)
    formatter.player.should have_received(:play).once.with(equals(MusicalSpec::Note.new('F4'))).once
  end

  it 'plays a lower-pitched sound when an example fails' do
    formatter = formatter_with_note('E4')
    formatter.example_failed(example)
    formatter.player.should have_received(:play).once.with(equals(MusicalSpec::Note.new('D4'))).once
  end

  it 'does not change the note when an example is pending' do
    formatter = formatter_with_note('E4')
    formatter.example_pending(example)
    formatter.player.should have_received(:play).once.with(equals(MusicalSpec::Note.new('E4'))).once
  end

  let(:subject) { MusicalSpec::Formatter.new(StringIO.new) }
  let(:example){ RSpec::Core::ExampleGroup.describe.example }

  def formatter_with_note(note)
    formatter = MusicalSpec::Formatter.new(StringIO.new, note)
    formatter.player.stubs(:play)

    formatter
  end
end
