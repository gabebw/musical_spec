module MusicalSpec
  # Uses scientific notation, e.g. C4 is middle C.
  class Note
    include Comparable

    SCALE_PROGRESSION = %w(C D E F G A B)

    # Takes 1 optional argument, a note string like "C4".
    def initialize(desired_note_string = nil)
      self.note = desired_note_string || LOWEST_NOTE.to_s
    end

    # A string like "C4".
    def to_s
      "#{letter}#{octave}"
    end

    # Set the note to a new one, e.g. `note.note = 'A5'`
    def note=(new_note)
      new_letter, new_octave = new_note.split('')
      @letter = new_letter
      @octave = new_octave.to_i

      to_s
    end

    # Increase the pitch, handling octave changes. Will not go above
    # MusicalSpec::HIGHEST_NOTE.
    def next!
      if below_highest_note?
        if @letter == SCALE_PROGRESSION.last
          @letter = SCALE_PROGRESSION.first
          @octave += 1
        else
          @letter = SCALE_PROGRESSION[SCALE_PROGRESSION.index(@letter) + 1]
        end
      end
    end

    # Decrease the pitch, handling octave changes. Will not go below
    # MusicalSpec::LOWEST_NOTE.
    def prev!
      if above_lowest_note?
        if @letter == SCALE_PROGRESSION.first
          @letter = SCALE_PROGRESSION.last
          @octave -= 1
        else
          @letter = SCALE_PROGRESSION[SCALE_PROGRESSION.index(@letter) - 1]
        end
      end
    end

    protected

    attr_reader :letter, :octave

    def <=>(other_note)
      if octave == other_note.octave
        SCALE_PROGRESSION.index(letter) <=> SCALE_PROGRESSION.index(other_note.letter)
      else
        octave <=> other_note.octave
      end
    end

    private

    def below_highest_note?
      self < HIGHEST_NOTE
    end

    def above_lowest_note?
      self > LOWEST_NOTE
    end
  end
end
