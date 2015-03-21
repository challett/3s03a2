/*
 * =============================================================================
 * This Java class reads the third fields of all records in the input file, 
 * processes and writes statistics about occurrences of 'A', 'D' and 'W' to the 
 * output file.
 *
 * =============================================================================
 */

import java.util.Scanner;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;
import java.io.PrintWriter;

class RecordProcessor {

  static final int SUBSECTION_LENGTH = 6; //The subsection lineNum
  static final char[] chars = {'A', 'D', 'V'}; // The characters to count
  static final String OUTPUT_FILE_NAME = "output.txt"; //The output file name
  /*
   * ===========================================================================
   *  Method process(): processes the third fields and write to the output file.
   *
   *  Input : String thirdFields -- the array of third fields
   * ===========================================================================
   */

  public static void process(String[] thirdFields) throws IOException {

    int lineNum = 0;
    char[] fieldChars;
    boolean endReached = (thirdFields[0] == null);
    int[] subsection = new int[chars.length];

    // Get the number of lines
    while (lineNum <= RecordReader.MAX_LINE_NUM && !endReached) {
      lineNum++;
      endReached = (thirdFields[lineNum] == null);
    }

    byte[][] count = new byte[lineNum][];

    // Open the output file
    FileWriter textFileWriter = new FileWriter(OUTPUT_FILE_NAME);
    PrintWriter textWriter = new PrintWriter(textFileWriter);

    // Go through each line
    for (int i = 0; i < lineNum; i++) {
      count[i] = new byte[chars.length];
      fieldChars = thirdFields[i].toCharArray();
      // Go through each character in the field
      for (int j = 0; j < fieldChars.length; j++) {
        // Go through each character to count
        for (int k = 0; k < chars.length-1; k++) {
          // Match and count
          if (fieldChars[j] == chars[k]) {
            count[i][k]++;
          }
        }
      }
    }

    // Go through each line
      int i = 1;
    while (i < lineNum) {

      // Print the first half of the line
      textWriter.print(i + 1);
      for (int k = 0; k < chars.length; k++) {
        textWriter.printf(", %d", count[i][k]);
        subsection[k] += count[i][k];
      }

      // Print the second half of the line
      if (i + SUBSECTION_LENGTH < lineNum) {
        textWriter.printf(",      %d", i + SUBSECTION_LENGTH + 1);
        for (int k = 0; k < chars.length; k++) {
          subsection[k] += count[i + SUBSECTION_LENGTH][k];
          textWriter.printf(", %d", count[i + SUBSECTION_LENGTH][k]);
        }
      }
      else {
        textWriter.printf(",      %d, 0, 0, 0", i + SUBSECTION_LENGTH + 1);
      }
      textWriter.println();

      // Print the separate line
      if ((i + 1) % (2 * SUBSECTION_LENGTH) == SUBSECTION_LENGTH) {
        textWriter.printf("For the above %d lines, ", SUBSECTION_LENGTH);
        for (int k = 0; k < chars.length; k++) {
          textWriter.printf("number of %c: %d", chars[k], subsection[k]);
          if (k < chars.length - 1) {
            textWriter.print(" **** ");
          }
        }
        textWriter.println();
        subsection = new int[chars.length];
        i += SUBSECTION_LENGTH + 1;
      }
      else {
        i++;
      }

    }

    // Close writer when done
    textWriter.close();

  }

  public static void main(String args[]) throws IOException {

    Scanner keyboard = new Scanner(System.in); // Keyboard input scanner.
    String input, output; // Input / output file names
    boolean inputValid; // If input file name is valid
    String[] thirdFields; // thrid thirdFields of all records

    // Print welcome message.

    System.out.println("Welcome to The Record Processor");
    System.out.println("-------------------------------");

    // Prompt user for input.

    inputValid = false;
      int count= 0;
    while ((!inputValid) && count < 4) {
      try {
        System.out.print("Please input the input file name: ");
        input = keyboard.next();
          count++;
        // Read the file
        thirdFields = RecordReader.readThirdFieldsFromFile(input);
        // Set the flag
        inputValid = true;
        // Process the thirdFields
        process(thirdFields);
      }
      catch (IOException e) {
        System.out.println("Sorry, cannot open the file for reading!");
          if (count >= 4){System.out.println("It is over!");};
      }
    }

    // Close scanner when done
    keyboard.close();

  }

}
