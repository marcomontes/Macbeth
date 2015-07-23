class TextAnalyzer

  attr_reader :text_data, :words_counter

  def initialize(text)
    @text_data = text
    @words_counter = Hash.new(0)
  end

  def analyze
    words = get_array_of_words(text_data)
    selected_words = remove_unneeded_words(words)
    normalized_words = get_normalized_words(selected_words)
    count_common_words(normalized_words)
  end

  # Use regular expressión to put single words into array, punctation are ignored
  def get_array_of_words(text)
    text.split(/\W+/)
  end

  # Eliminate all words that are 4 characters or less
  def remove_unneeded_words(words_array)
    words_array.delete_if {|w| w.length < 5}
    words_array.compact
  end

  # Downcase words due to cases like: Macbeth, MACBETH, macbeth
  def get_normalized_words(words_array)
    words_array.collect {|w| w.downcase }
  end

  # Get a hash with counter value per each word
  def count_common_words(words_array)
    words_array.each { |word| words_counter[word] += 1 }
    words_counter.sort_by(&:last).reverse
  end

  #
  # Call this method instead of 'analyze' on macbeth.rb if you want to use a summarized version with less code
  #
  def single_method
    words = text_data.split(/\W+/).delete_if{|w| w.length < 5}.compact.collect{|w| w.downcase}
    words.each { |word| words_counter[word] += 1 }
    words_counter.sort_by(&:last).reverse
  end

end