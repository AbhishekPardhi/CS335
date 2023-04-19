class test_4
{  
    public static void main(String args[])
    {  
		int x = 20;
		int y = 18;
		if (x > y) {
			println(x); // Prints 20
		}  

		for (int i = 0; i < 10; i++) {
			x++;
		}
		
		while (x < 30) {
			x++;
			if (x == 25) {
				x += 2;
			}
			y++;
		}
		println(x); // Prints 30
		println(y); // Prints 26
	}
}