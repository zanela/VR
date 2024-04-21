# tests/remove_text_spec.rb

require_relative '../remove_text_method'

describe '#remove_text_after_symbols' do
  context 'Cenário 1' do
    it 'remove o texto após os marcadores' do
      input_string = "bananas, tomates # e ventiladores"
      markers = ["#", "!"]
      expected_output = "bananas, tomates"
      expect(remove_text_after_symbols(input_string, markers)).to eq(expected_output)
    end
  end

  context 'Cenário 2' do
    it 'remove o texto após os marcadores' do
      input_string = "o rato roeu a roupa $ do rei % de roma"
      markers = ["%", "!"]
      expected_output = "o rato roeu a roupa $ do rei"
      expect(remove_text_after_symbols(input_string, markers)).to eq(expected_output)
    end
  end

  context 'Cenário 3' do
    it 'remove o texto após os marcadores' do
      input_string = "the quick brown fox & jumped over * the lazy dog"
      markers = ["&", "*", "%", "!"]
      expected_output = "the quick brown fox"
      expect(remove_text_after_symbols(input_string, markers)).to eq(expected_output)
    end
  end
end
