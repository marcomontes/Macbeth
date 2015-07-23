require_relative '../lib/text_analyzer.rb'

describe TextAnalyzer do

  let(:analyzer) { TextAnalyzer.new(@macbeth_text) }

  before :all do
    @macbeth_text = <<-eof
      DUNCAN
          Dismay'd not this
          Our captains, Macbeth and Banquo?
      Sergeant
          Yes;
          As sparrows eagles, or the hare the lion.
          If I say sooth, I must report they were
          As cannons overcharged with double cracks, so they
          Doubly redoubled strokes upon the foe:
          Except they meant to bathe in reeking wounds,
          Or memorise another Golgotha,
          I cannot tell.
          But I am faint, my gashes cry for help.
      DUNCAN
          So well thy words become thee as thy wounds;
          They smack of honour both. Go get him surgeons.
          Exit Sergeant, attended
          Who comes here?
          Enter ROSS
      MALCOLM
          The worthy thane of Ross.
      LENNOX
          What a haste looks through his eyes! So should he look
          That seems to speak things strange.
      ROSS
          God save the king!
    eof

  end

  describe '#analyze' do

    it 'returns an array with single words from text' do
      expect(analyzer.get_array_of_words(@macbeth_text)).to be_an_instance_of(Array)
    end

    it 'returns an array of words greater than 4 characters' do
      words = analyzer.get_array_of_words(@macbeth_text)
      any_word = analyzer.remove_unneeded_words(words).first
      expect(any_word.length).to be >= 5
    end

    it 'returns an array with a counter of words' do
      expect(analyzer.analyze).to be_an_instance_of(Array)
    end

  end
end