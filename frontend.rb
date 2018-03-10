require 'unirest'

base_url = "http://localhost:3000"

p "Lets make a mix tape."

p "What would you like to do first?"

p "[1] See all songs"
p "[2] See one song"
p "[3] Add a song"
p "[4] Update a song"
p "[5] Delete a song"

user_input = gets.chomp

# show all songs
if user_input == "1"
  system "clear"
  all_response = Unirest.get("#{base_url}/songs")
  songs = all_response.body

  songs.each do |song|
    p "Id: #{song['id']}"
    p "title: #{song['title']}"
    p "artist: #{song['artist']}"
    p "genre: #{song['genre']}"
    p "bpm: #{song['bpm']}"
    p "mood: #{song['mood']}"
    p "-" * 30
  end

# show a specified song
elsif user_input == "2"
  system "clear"
  p "What song would you like to see?"
  input_id = gets.chomp
  response = Unirest.get("#{base_url}/songs/#{input_id}")
  song = response.body

  p "Id: #{song['id']}"
  p "title: #{song['title']}"
  p "artist: #{song['artist']}"
  p "genre: #{song['genre']}"
  p "bpm: #{song['bpm']}"
  p "mood: #{song['mood']}"

# Create a new song
elsif user_input == "3"
  system "clear"
  p "Please enter the new song title:"
  input_title = gets.chomp

  response = Unirest.post("#{base_url}/songs", parameters: {input_title: input_title, input_price: input_price, input_description: input_description})

elsif user_input == "4"
  system "clear"
  p "What song would you like to see?"
  input_id = gets.chomp.to_i
  response = Unirest.get("#{base_url}/songs/#{input_id}")
  song = response.body

  p "Id: #{song['id']}"
  p "title: #{song['title']}"
  p "artist: #{song['artist']}"
  p "genre: #{song['genre']}"
  p "bpm: #{song['bpm']}"
  p "mood: #{song['mood']}"

  p "What would you like to update?"
  p "[1] title"
  user_input2 = gets.chomp

  if user_input2 == "1"
    p "Please enter the new song title: (currently: #{song["title"]})"
    input_title = gets.chomp
    response = Unirest.patch("#{base_url}/songs/#{input_id}", parameters: {input_title: input_title, input_price: song['price'], input_description: song['description']})
  end

end

