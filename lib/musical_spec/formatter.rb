# RSpec will only require this file, so require the rest of the gem.
require 'musical_spec'
require 'rspec/core/formatters/progress_formatter'

module MusicalSpec
  class Formatter < RSpec::Core::Formatters::ProgressFormatter
    RSpec::Core::Formatters.register self, :example_passed, :example_failed,
      :example_pending

    def initialize(output, note = nil)
      super(output)
      @note = Note.new(note)
      @player = Player.new
    end

    attr_reader :player

    # Plays a higher note then print a progress dot
    def example_passed(notification)
      play_higher_note
      super
    end

    # Plays a lower note then print a progress dot
    def example_failed(notification)
      play_lower_note
      super
    end

    # Plays a note without changing the pitch then print a progress dot
    def example_pending(notification)
      play_note
      super
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
