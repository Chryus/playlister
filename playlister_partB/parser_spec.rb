require 'awesome_print.rb'
# require './lib/artist.rb'
# require './lib/genre.rb'
# require './lib/song.rb'
require './parser.rb'

describe Parser, "#parse_files" do
  
  it 'should take an array of strings and return an array with three indices' do
    expect(parse_files(["A$AP Rocky - Peso [dance].mp3"])).to eq([["A$AP Rocky", "Peso", "dance"]]) 
  end

end