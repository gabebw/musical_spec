# RSpec will only require this file, so require the rest of the gem.
require 'musical_spec'
require 'rspec/core/formatters/progress_formatter'

module MusicalSpec
  class Formatter < RSpec::Core::Formatters::ProgressFormatter
    def initialize(output)
      super(output)
      @note   = Note.new
      @player = Player.new
    end

    attr_reader :player

    # Plays a higher note and then calls super.
    def example_passed(example)
      play_higher_note
      super(example)
    end

    # Plays a lower note and then calls super.
    def example_failed(example)
      play_lower_note
      super(example)
    end

    # Plays a note without changing the pitch and then calls super.
    def example_pending(example)
      play_note
      super(example)
    end

    private

    def play_note
      @player.play(note)
    end

    def play_higher_note
      @note.next!
      play_note
    end

    def play_lower_note
      @note.prev!
      play_note
    end


    def note
      @note.note
    end
  end
end
