module MusicalSpec
  # Uses scientific notation, e.g. C4 is middle C.
  class Note
    # The highest octave this will play. If it goes higher than this, it will be
    # normalized back down to MAX_OCTAVE.
    MAX_OCTAVE = 6
    # The lowest octave this will play. If it goes lower than this, it will be
    # normalized back up to MIN_OCTAVE.
    MIN_OCTAVE = 2

    def initialize
      @letter = 'C'
      @octave = 4
    end

    # A string like "C4". Octave (the number) does not go above MAX_OCTAVE or
    # below MIN_OCTAVE.
    def note
      "#{@letter}#{normalized_octave}"
    end

    # Set the note to a new one, e.g. `note.note = 'A5'`
    def note=(new_note)
      new_letter, new_octave = new_note.split('')
      @letter = new_letter
      @octave = new_octave.to_i

      note
    end

    # Increase the pitch, handling octave changes.
    def next!
      if @letter == 'B'
        @letter = 'C'
        @octave += 1
      elsif @letter == 'G'
        @letter = 'A'
      else
        @letter.next!
      end
    end

    # Decrease the pitch, handling octave changes.
    def prev!
      if @letter == 'C'
        @letter = 'B'
        @octave -= 1
      elsif @letter == 'A'
        @letter = 'G'
      else
        @letter = (@letter.ord - 1).chr
      end
    end

    private

    def normalized_octave
      if @octave > MAX_OCTAVE
        MAX_OCTAVE
      elsif @octave < MIN_OCTAVE
        MIN_OCTAVE
      else
        @octave
      end
    end
  end
end
