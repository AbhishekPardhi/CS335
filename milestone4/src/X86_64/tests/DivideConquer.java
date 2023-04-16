// Java code to demonstrate Divide and
// Conquer Algorithm
import static java.lang.System.out;

class DivideConquer{

// Function to find the maximum no.
// in a given array.
static int DAC_Max(int a[], int index, int l)
{
	int max;
	if(l - 1 == 0)
	{
	return a[index];
	}
	if (index >= l - 2)
	{
		if (a[index] > a[index + 1])
			return a[index];
		else
			return a[index + 1];
	}

	// Logic to find the Maximum element
	// in the given array.
	max = DAC_Max(a, index + 1, l);

	if (a[index] > max)
		return a[index];
	else
		return max;
}

// Function to find the minimum no.
// in a given array.
static int DAC_Min(int a[], int index, int l)
{
	int min;
	if(l - 1 == 0)
	{
	return a[index];
	}
	if (index >= l - 2)
	{
		if (a[index] < a[index + 1])
			return a[index];
		else
			return a[index + 1];
	}

	// Logic to find the Minimum element
	// in the given array.
	min = DAC_Min(a, index + 1, l);

	if (a[index] < min)
		return a[index];
	else
		return min;
}

// Driver Code
public static void main(String[] args)
{
	
	// Defining the variables
	int min, max;

	// Initializing the array
    int a[] = new int[7];
    a[0] = 70;
    a[1] = 250;
    a[2] = 50;
    a[3] = 80;
    a[4] = 140;
    a[5] = 12;
    a[6] = 14;

	// Recursion - DAC_Max function called
	max = DAC_Max(a, 0, 7);

	// Recursion - DAC_Max function called
	min = DAC_Min(a, 0, 7);
	
	// printlnf("The minimum number in " +
	// 				"a given array is : %d\n", min);
	// printlnf("The maximum number in " +
	// 				"a given array is : %d", max);
}
}
