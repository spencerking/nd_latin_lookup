require 'net/http'

# Ensure a word has been provided if a language was specified
def word_check
  if ARGV[1] == nil
    puts 'Please provide a word to look up.'
    exit
  end
end

# Latin to English lookup
def latin_to_english(word)
  src = 'http://archives.nd.edu/cgi-bin/wordz.pl?keyword=' + word
  uri = URI(src)
  Net::HTTP.get(uri)
end

# English to Latin lookup
def english_to_latin(word)
  src = 'http://archives.nd.edu/cgi-bin/wordz.pl?english=' + word
  uri = URI(src)
  Net::HTTP.get(uri)
end

# Parse out HTML and print the results
def print_results(results)
  i = 0
  bracket = false
  while i < results.length
    if results[i] == '<'
      bracket = true
    elsif results[i] == '>'
      bracket = false
    elsif bracket == true
      # Do nothing
    else
      print results[i]
    end

    i += 1
  end
end

def main
  if ARGV[0] == nil
    puts 'Please provide arguments.'
    exit
  end

  results = nil

  if ARGV[0] == '-e'
    word_check
    results = english_to_latin(ARGV[1])
  elsif ARGV[0] == '-l'
    word_check
    results = latin_to_english(ARGV[1])
  else
    results = latin_to_english(ARGV[0])
  end

  print_results(results)
end

main
