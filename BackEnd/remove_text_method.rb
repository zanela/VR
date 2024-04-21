def remove_text_after_symbols(input_string, symbols)
    symbols.each do |symbol|
      index = input_string.index(symbol)
      input_string = input_string[0...index] if index
    end
    input_string.strip
  end
  