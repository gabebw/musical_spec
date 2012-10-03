# RSpec will only require this file, so require the rest of the gem.
require 'musical_spec'
require 'rspec/core/formatters/progress_formatter'

module MusicalSpec
  class Formatter < RSpec::Core::Formatters::ProgressFormatter
    def initialize(output, note = nil)
      super(output)
      @note = Note.new(note)
      @player = Player.new
    end

    attr_reader :player

    # Plays a higher note then call super.
    def example_passed(example)
      play_higher_note
      super(example)
    end

    # Plays a lower note then call super.
    def example_failed(example)
      play_lower_note
      super(example)
    end

    # Plays a note without changing the pitch then call super.
    def example_pending(example)
      play_note
      super(example)
    end

    private

    def play_note
      @player.play(@note)
    end

    def play_higher_note
      @note.higher!
      play_note
    end

    def play_lower_note
      @note.lower!
      play_note
    end
  end
end
