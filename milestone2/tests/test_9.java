/* Package and Import Statements */

package CustomPackage;

import java.util.Scanner;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.ArrayList;

 
// Public class
public class ComputerScienceDepartment {
    String name;
    int marks;
 
    // user defined constructor method
    public ComputerScienceDepartment(String studentName,
                                     int studentMarks)
    {
        // Assigning values to data
        // members with the help of
        // values passed to the constructor
        name = studentName;
        marks = studentMarks;
    }
 
    // Display method to display student's information
    public void display()
    {
        System.out.println("Name: " + name + '\n'
                           + "Marks : " + marks + '\n'
                           + "Department: "
                           + "Computer Science" + '\n');
    }
}