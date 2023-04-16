// Java program for implementation of Bubble Sort
import java.util.*;
import static java.lang.System.out;

class BubbleSort {
	void bubbleSort(int arr[])
	{
		int n = 5;
		for (int i = 0; i < n - 1; i++){
			for (int j = 0; j < n - i - 1; j++){
				if (arr[j] > arr[j + 1]) {
					// swap arr[j+1] and arr[j]
					int temp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = temp;
				}
            }
        }
	}

	/* Prints the array */
	void printArray(int arr[])
	{
		int n = 5;
		for (int i = 0; i < n; ++i)
			out.println(arr[i] + " ");
		out.println();
	}

	// Driver method to test above
	public static void main(String args[])
	{
		BubbleSort ob = new BubbleSort();
        int arr[]=new int[5];
        arr[0]=5;
        arr[1]=1;
        arr[2]=4;
        arr[3]=2;
        arr[4]=8;

		ob.bubbleSort(arr);
		out.println("Sorted array");
		ob.printArray(arr);
	}
}
