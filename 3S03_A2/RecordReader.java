/*
 * =============================================================================
 * This Java class models a reader that reads from a text file, and returns the
 * thrid fields of all records in an array of Strings.
 *
  * =============================================================================
 */

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

class RecordReader {

  static final int MAX_LINE_NUM = 50; // Maximum number of lines
  static final char FIELD_TERMINATOR = ',';// The field terminator

  /*
   * ===========================================================================
   *  Method readThirdFieldsFromFile(): returns the third fields of all records
   *
   *  Input  : String inputFileName -- the name of input file
   *  Output : String[] -- the third fields of all records
   * ===========================================================================
   */

  public static String[] readThirdFieldsFromFile(String inputFileName)
    throws FileNotFoundException, IOException {

    // Open the input file
    FileReader textFileReader = new FileReader(inputFileName);
    BufferedReader textReader = new BufferedReader(textFileReader);

    String[] thirdFields = new String[MAX_LINE_NUM]; // The result
    String record; // A line of record
    int fieldTerminatorIndex1, fieldTerminatorIndex2, fieldTerminatorIndex3;
    int row = 0;

    record = textReader.readLine();
    while (record != null) {
      fieldTerminatorIndex1 = record.indexOf(FIELD_TERMINATOR);
      fieldTerminatorIndex2 = record.indexOf(FIELD_TERMINATOR, 
        fieldTerminatorIndex1 + 1);
      fieldTerminatorIndex3 = record.indexOf(FIELD_TERMINATOR, 
        fieldTerminatorIndex2 + 1);
      thirdFields[row++] = record.substring(fieldTerminatorIndex2 + 1, 
        fieldTerminatorIndex3);
      record = textReader.readLine();
    } 

    // Close reader when done
    textReader.close();
    return thirdFields;

  }

}
