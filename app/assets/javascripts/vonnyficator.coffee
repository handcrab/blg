class Translator
  STATIC_NAMES:
    "винни" : "Вонни"
    "вонни" : "Вонни"
    "пятачок" : "Потачок"
    "потачок" : "Потачок"
    "кролик" : "Корлик"
    "сова" : "Своа"
    "своа" : "Своа"
    "курорт" : "крорт"
    "поехали" : "пехли"
    "и" : "и"
    "на" : "на"
    "не" : "ен"
    "пока" : "пка"
    "меня" : "мн"
    "я" : "я"
    "печенько" : "пчнк"
    "просто" : "прст"

  # CONSTANTS: "бвгджзйклмнпрстфхцчшщ"
  VOWELS: "аеёиоуэюяыьъeyuioa"

  vowels_pattern: ->  new RegExp "[#{@VOWELS}]", 'g'
  not_vowels_pattern: -> new RegExp "[^#{@VOWELS}]", 'g'

  is_vowel: (char) ->
    # _.contains @VOWELS, char
    char in @VOWELS.split ''

  process_word: (word) ->
    return word if word.size < 2

    # keep the 1st char  
    first_char = if word[0]? then word[0] else ''

    # keep last 2 vowels
    last_chars = word[-2..-1]  
    last_chars = if @is_vowel last_chars[1] # _.last 
      not_vowels_pattern = new RegExp "[^#{@VOWELS}]", 'g'
      last_chars.replace not_vowels_pattern, '' 
    else
      ''

    vowels_pattern = new RegExp "[#{@VOWELS}]", 'g'    
    new_word = word[1..].replace vowels_pattern, ''
    
    new_word = first_char + new_word + last_chars


  translate: (str) ->
    words = str.toLowerCase().split ' '
    new_words = []
  
    new_words = for word in words
      if word of @STATIC_NAMES
        @STATIC_NAMES[word]
      else
        @process_word word      
    new_words.join ' '

window.Vonnyficator = Translator