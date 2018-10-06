%%// Options of the scanner

%class Lexer2	//Name
%unicode			//Use unicode
%line         //Use line counter (yyline variable)
%standalone		//Tell that Jflex don't use a parser

%init{//code to execute before scanning
	System.out.println("Init exercise 2");
%init}

%{//adding Java code (methods, inner classes, ...)
private int alphaNumericCharacters = 0;
private int alphaNumericWords = 0;
private int alphaNumericLines = 0;
private int lines = 0;

private boolean isAWord = true;

private boolean alphaCharacterFound = false;

private boolean aux = false;

private boolean nonAlphaFound = false;

private void countAlphaNumericCharacter(){
    alphaCharacterFound = true;
    aux = true;
    alphaNumericCharacters++;
}

private void alphaNumericWords(){
    if(alphaCharacterFound){
        alphaNumericWords++;
        alphaCharacterFound = false;
    }
}

private void alphaNumericLine(){
    System.out.print("nonAlphaFound" + nonAlphaFound);
    
    if(nonAlphaFound){
       alphaNumericLines++;
       nonAlphaFound = false;
    }
}

 private void nonAlphaNumChar(){
    nonAlphaFound = true;
}
 private void testNumeric(String number){
     System.out.print(number);
 }           
%}

%eof{//code to execute after scanning
   System.out.println("Finish Execution of exercise 2");
   System.out.println("alphaNumericCharacters: " + alphaNumericCharacters);
   System.out.println("alphaNumericWords: " + alphaNumericWords);
   System.out.println("alphaNumericLines: " + alphaNumericLines);
   System.out.println("lines: " + lines);
%eof}

//Extended Regular Expressions
// Expected output:
// Alphanumeric characters: 197
// Alphanumeric words: 35
// Alphanumeric lines: 3

Alpha          = [A-Z]|[a-z]
Numeric        = [0-9]
AlphaNumericCharacter	 = {Alpha}|{Numeric}
Space = "\t" | " "
EndOfLine = "\r"?"\n"

%% //Identification of tokens

{Alpha}	{countAlphaNumericCharacter();}
{Space}+ {alphaNumericWords();}
{EndOfLine} {alphaNumericLine();}
.		    {nonAlphaNumChar();}