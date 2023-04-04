// Java program to Illustrate Type promotion in Expressions

// Main class
class TypeConv {

	// Main driver method
	public static void main(String args[])
	{

		// Declaring and initializing primitive types
		char c = 'a';
		int i = 50000;
		float f = 5.67f;
		double d = .1234;

		// The Expression
		double result = (f * 1) + (i / c) - (d * 5);

		// Printing the result obtained after
		// all the promotions are done
		println("result = " + result);
	}
}
