# Use a combination of Enum.map/2 and String.replace/3 to replace all the e's in these words with another letter of your choosing: ["a", "very", "fine", "collection", "of", "words", "enunciated"]
words = ["a", "very", "fine", "collection", "of", "words", "enunciated"]
Enum.map(words, &String.replace(&1, "e", "a"))
# Use Enum.reduce/2 to multiply these numbers together: [5, 12, 9, 24, 9, 18]
scores = [5, 12, 9, 24, 9, 18]
Enum.reduce(scores, fn (number, sum) -> sum * number end)