#!/usr/bin/env ruby
#encoding: utf-8

regex = ARGV[0]
dir_path = ARGV[1]

# Removes part of the file name for mp3 files
#
# For now is super specific, but the regex can be updated later

Dir.foreach(dir_path) do |file|
  if (File.extname(file) == '.mp3') then
    old_name = File.basename(file)
    new_name = old_name.sub /\w+\s\w+\s\w+\s-\s/, ''
    old_name = File.join(dir_path, old_name)
    new_name = File.join(dir_path, new_name)
    File.rename(old_name, new_name)
    puts new_name
  end
end
