# musical_spec

An RSpec formatter that plays higher notes as tests pass and lower notes as
tests fail. A revelatory auditory experience! It's a subclass of the progress
formatter, so you still get your pretty dots.

## Usage

This uses [Bloopsaphone](https://github.com/mental/bloopsaphone), which requires PortAudio:

    brew install portaudio

In your Gemfile:

    gem 'musical_spec'

Then run your specs like this:

    $ rspec --format MusicalSpec::Formatter spec/

To always run your specs with MusicalSpec, add the option to your `.rspec` file:

    --format MusicalSpec::Formatter

## Caveats

Due to Bloopsaphone wackiness, this library has to `sleep` while the sounds
are playing. This will probably slow your test suite down a LOT.
Also, sometimes the sounds can't keep up with the test suite and some of the
sounds don't play. The dots still show up though.
