module MusicalSpec
  # This class plays the music using Bloopsaphone.
  class Player
    def initialize
      @sound = ONE_TRUE_BLOOPSAPHONE.sound(Bloops::SQUARE)
      @sound.sustain = 0.01
      ONE_TRUE_BLOOPSAPHONE.tempo = 320
    end

    # Takes a Note instance.
    def play(note)
      ONE_TRUE_BLOOPSAPHONE.clear
      ONE_TRUE_BLOOPSAPHONE.tune(@sound, note.to_s)
      ONE_TRUE_BLOOPSAPHONE.play
      sleep 0.01 while ! ONE_TRUE_BLOOPSAPHONE.stopped?
    end
  end
end
