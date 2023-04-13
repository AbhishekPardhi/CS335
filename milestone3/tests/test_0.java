/* MERGE SORT */

class MergeSort {
	void merge(int arr[], int l, int m, int r)
	{
		int n1 = m - l + 1;
		int n2 = r - m;
		/* Create temp arrays */
		int L[] = new int[n1];
		int R[] = new int[n2];

		/*Copy data to temp arrays*/
		for (int i = 0; i < n1; ++i)
			L[i] = arr[l + i];
		for (int j = 0; j < n2; ++j)
			R[j] = arr[m + 1 + j];

		/* Merge the temp arrays */

		// Initial indexes of first and second subarrays
		int i = 0, j = 0;

		// Initial index of merged subarray array
		int k = l;
		while (i < n1 && j < n2) {
			// if (L[i] <= R[j]) {
			// 	arr[k] = L[i];
			// 	i++;
			// }
			// else {
			// 	arr[k] = R[j];
			// 	j++;
			// }
			k++;
		}

		/* Copy remaining elements of L[] if any */
		while (i < n1) {
			arr[k] = L[i];
			i++;
			k++;
		}

		/* Copy remaining elements of R[] if any */
		while (j < n2) {
			arr[k] = R[j];
			j++;
			k++;
		}
	}

	// Main function that sorts arr[l..r] using
	// merge()
	void sort(int arr[], int l, int r)
	{
		if (l < r) {
			// Find the middle point
			int m = l + (r - l) / 2;

			// Sort first and second halves
			sort(arr, l, m);
			sort(arr, m + 1, r);

			merge(arr,l,m,r);
		}
	}

	/* A utility function to print array of size n */
	static void printArray(int arr[])
	{
		int n = 6;
		for (int i = 0; i < n; ++i)
			println(arr[i] + " ");
		println(6);
	}

	// Driver code
	public static void main(String args[])
	{
		int arr[] = new int[6];
		arr[0] = 12;
		arr[1] = 11;
		arr[2] = 13;
		arr[3] = 5;
		arr[4] = 6;
		arr[5] = 7;

		println("Given Array");
		printArray(arr);

		MergeSort ob = new MergeSort();
		ob.sort(arr, 0, 6 - 1);

		println("\nSorted array");
		printArray(arr);
	}
}
