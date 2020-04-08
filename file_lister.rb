# file_lister.rb
=begin
Lists filenames in public/, creating metalink to file contents and allowing ordering of files ('sort ascending' A-Z, 'sort descending' Z-A)
=end
require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @title = 'File Lister'
  @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort
  @files.reverse! if params[:sort] == "desc"

  erb :list
end
