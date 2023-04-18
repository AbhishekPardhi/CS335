// Java program to Illustrate Type promotion in Expressions

// Main class
class TypeConv {

	public static int sum(int a, int b)
	{
		return a+b;
	}
	// Main driver method
	public static void main(String args[])
	{

		// Declaring and initializing primitive types
		// char c = 'a';
		int i = 50000;
		int j=0;

		// The Expression
		double result = (j+i+(j+i+(j+i+(j+i+(i+j+(i+j+(i+j+(i+j+(i+j+(i+j))))))))));

		// // Printing the result obtained after
		// // all the promotions are done
		// println("result = " + result);
		// int a[][]= new int[5][9];
		// a[3][4] =1;
		// int a = - 5;
		int b = 6;
		// int c = 0;
		// c++;
		// c--;
		// ++c;
		// --c;
		int d = 0;
		d= !b;
		int e = ~b;

		int f = sum(i,j);

	}
}
