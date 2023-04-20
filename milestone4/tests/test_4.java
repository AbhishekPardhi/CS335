class test_4
{  
    public static void main(String args[])
    {  
		int x = 20;
		int y = 18;
		if (x > y) {
			println("Initial value of x = ");
			println(x); // Prints 20
		}  

		for (int i = 0; i < 10; i++) {
			x++;
		}
		
		while (x < 40) {
			x++;
			if (x == 35) {
				println("Value of y = ");
				println(y); // Prints 22
			}
			y++;
		}
		println("Final Value of x = ");
		println(x); // Prints 40
	}
}