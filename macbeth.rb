require_relative './lib/text_analyzer.rb'

macbeth_file = File.open("macbeth.txt")#
words_counter = TextAnalyzer.new(macbeth_file.read).analyze
macbeth_file.close
puts "The second most common word greater than 4 characters is: '#{words_counter[1][0]}' and it appears #{words_counter[1][1]} times"
