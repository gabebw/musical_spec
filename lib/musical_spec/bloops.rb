#!/usr/bin/env ruby
class SoundPlayer
  def initialize
    @bloopsaphone = Bloops.new
    @sound = @bloopsaphone.sound(Bloops::SQUARE)
    @sound.sustain = 1

    @note = Note.new
  end

  def start
    200.times do
      @bloopsaphone.clear
      if success?
        @note.next!
      else
        @note.next!
        # @note.prev!
      end

      @bloopsaphone.tune(@sound, @note.note)
      @bloopsaphone.play
      sleep 0.1 #while !@bloopsaphone.stopped?
    end
  end

  private

  def success?
    rand(2) == 0
  end
end


player = SoundPlayer.new
player.start
