// Java program to Illustrate Type promotion in Expressions

// Main class
class TypeConv {


	public static int sum(int a, int b){
		int c = a+b;
		return c;
	}
	// Main driver method
	public static void main(String args[])
	{

		// Declaring and initializing primitive types
		char c = 'a';
		int i = 5;
		int j=0;
		int k = sum(i,j);

		// The Expression
		// k = (i + j+(i+j+(i+j+(i+j+(i+j+(i+j+(i+j+(i+j+(i+j+(i+j+(i+j+(i+j+(i+j+(i+j))))))))))))));
		// k++;
		// // Printing the result obtained after
		// // all the promotions are done
		// println("result = " + result);
		// int a[][]= new int[5][9];
		// a[4][8]=1;
	}
}
