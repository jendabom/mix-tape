class SongsController < ApplicationController
  def index
    songs = Song.all
    render json: songs.as_json
  end

  def create
    song = Song.new(
      title: params[:input_title], 
      artist: params[:input_artist], 
      length: params[:input_length], 
      genre: params[:input_genre], 
      bpm: params[:input_bpm], 
      mood: params[:input_mood]
    )

    song.save
    render json: product.as_json
  end

  def show
    id = params[:id]
    song = Song.find(id)
    render json: song.as_json
  end

  def update
    id = params[:id]
    song = Song.find(id)

    song = Song.update(
      title: params[:input_title], 
      artist: params[:input_artist], 
      length: params[:input_length], 
      genre: params[:input_genre], 
      bpm: params[:input_bpm], 
      mood: params[:input_mood]
    )
    
    render json: song.as_json
  end

  def destroy
    id = params[:id]
    song = Song.find(id)
    song.destroy
    render json: {message: "This song is no longer available for a mixtape. It has been deleted."}
  end
end
