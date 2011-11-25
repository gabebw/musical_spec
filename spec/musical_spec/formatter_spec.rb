require 'spec_helper'
require 'stringio'

describe MusicalSpec::Formatter do
  before { subject.player.stubs(:play) }

  it { should be_a RSpec::Core::Formatters::ProgressFormatter }

  it 'plays a higher-pitched sound when an example passes' do
    subject.example_passed(example)
    subject.player.should have_received(:play).with('D4')
  end

  it 'plays a lower-pitched sound when an example fails' do
    subject.example_failed(example)
    subject.player.should have_received(:play).with('B3')
  end

  it 'does not change the note when an example is pending' do
    subject.example_pending(example)
    subject.player.should have_received(:play).with('C4')
  end

  subject { MusicalSpec::Formatter.new(StringIO.new) }
  let(:example){ RSpec::Core::ExampleGroup.describe.example }
end
