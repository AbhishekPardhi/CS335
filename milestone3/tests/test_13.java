// A Naive Java Program for LIS Implementation
import java.io.*;
import java.util.*;

class LIS {

	// Stores the LIS
	int max_ref;

	// To make use of recursive calls, this function must
	// return two things: 1) Length of LIS ending with
	// element arr[n-1]. We use max_ending_here for this
	// purpose 2) Overall maximum as the LIS may end with an
	// element before arr[n-1] max_ref is used this purpose.
	// The value of LIS of full array of size n is stored in
	// *max_ref which is our final result
	static int _lis(int arr[], int n)
	{
		// Base case
		if (n == 1)
			return 1;

		// 'max_ending_here' is length of LIS ending with
		// arr[n-1]
		int res, max_ending_here = 1;

		// Recursively get all LIS ending with arr[0],
		// arr[1] ... arr[n-2]. If arr[i-1] is smaller
		// than arr[n-1], and max ending with arr[n-1] needs
		// to be updated, then update it
		for (int i = 1; i < n; i++) {
			res = _lis(arr, i);
			if (arr[i - 1] < arr[n - 1]
				&& res + 1 > max_ending_here)
				max_ending_here = res + 1;
		}

		// Compare max_ending_here with the overall max. And
		// update the overall max if needed
		if (max_ref < max_ending_here)
			max_ref = max_ending_here;

		// Return length of LIS ending with arr[n-1]
		return max_ending_here;
	}

	// The wrapper function for _lis()
	static int lis(int arr[], int n)
	{
		// The max variable holds the result
		max_ref = 1;

		// The function _lis() stores its result in max
		_lis(arr, n);

		// Returns max
		return max_ref;
	}

	// Driver program to test above functions
	public static void main(String args[])
	{
        int arr[]= new int[8];
        arr[0]=10;
        arr[1]=22;
        arr[2]=9;
        arr[3]=33;
        arr[4]=21;
        arr[5]=50;
        arr[6]=41;
        arr[7]=60;

		int n = arr.length;

		// Function call
		System.out.println("Length of lis is "
						+ lis(arr, n));
	}
}
// This code is contributed by Rajat Mishra
