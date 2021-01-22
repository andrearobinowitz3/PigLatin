public void setup() 
{
  String[] lines = loadStrings("words.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) 
  {
    System.out.println(lines[i]+" --> "+pigLatin(lines[i]));
  }
}
public void draw(){
  //not used
}


public boolean beginsWithQu (String sWord) 
// precondition: sWord is a valid String of length greater than 0.
// postcondition: returns True if the string has at least 2 characters,
// and the first two characters are "qu".
// if the string is less than two characters, or the initial two characters
// are not "qu", then False is returned.
{
  return ((sWord.length() >= 2) &&
          (sWord.substring(0,1).equals("q")) &&
          (sWord.substring(1,2).equals("u")));
}

public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  //System.out.println("Examining: "+sWord);
  for (int i = 0; i<sWord.length(); i++) {
    if ((sWord.substring(i,i+1).equals("a")) ||
        (sWord.substring(i,i+1).equals("e")) ||
        (sWord.substring(i,i+1).equals("i")) ||
        (sWord.substring(i,i+1).equals("o")) ||
        (sWord.substring(i,i+1).equals("u")))
        {
          //System.out.println(" Found a vowel at: "+i);
          return i;
        }
  }
  //System.out.println("No vowels found.");
  return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
  if(findFirstVowel(sWord) == -1)
  {
    // All consonants
    // System.out.println(" All consonants. ");
    return sWord + "ay";
  }
  else
  {
    if (beginsWithQu (sWord)) {
      // word begins with "qu"
      return sWord.substring(2,sWord.length())+"quay";
    }
    else {
      if (findFirstVowel(sWord) == 0) {
     // first letter is a vowel
         return sWord+"way";
      }
    else {
        // first letter(s) is/are a consonant
        // find the position of the first vowel.
        return sWord.substring(findFirstVowel(sWord),sWord.length())
                    +sWord.substring(0,findFirstVowel(sWord))+"ay";
    }
  }
  }
}
