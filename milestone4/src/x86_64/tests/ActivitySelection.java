// Java program for activity selection problem.

// The following implementation assumes that the activities
// are already sorted according to their finish time
import java.io.*;
import java.lang.*;
import java.util.*;
import static java.lang.System.out;

class ActivitySelection {
	// Prints a maximum set of activities that can be done
	// by a single person, one at a time.
	public static void printMaxActivities(int s[], int f[],
										int n)
	{
		int i, j;

		out.println(
			"Following activities are selected");

		// The first activity always gets selected
		i = 0;
		out.println(i + " ");

		// Consider rest of the activities
		for (j = 1; j < n; j++) {
			// If this activity has start time greater than
			// or equal to the finish time of previously
			// selected activity, then select it
			if (s[j] >= f[i]) {
				out.println(j + " ");
				i = j;
			}
		}
	}

	// Driver code
	public static void main(String[] args)
	{
        int s[] = new int[6];
        s[0]=1;
        s[1]=3;
        s[2]=0;
        s[3]=5;
        s[4]=8;
        s[5]=5;
        int f[] = new int[6];
        f[0]=2;
        f[1]=4;
        f[2]=6;
        f[3]=7;
        f[4]=9;
        f[5]=9;

		int n = 6;

		// Function call
		printMaxActivities(s, f, n);
	}
}
