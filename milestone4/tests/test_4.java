class test_4
{  
    public static void main(String args[])
    {  
		int x = 20;
		int y = 18;
		if (x > y) {
			println(x);
		}  

		for (int i = 0; i < 10; i++) {
			x++;
		}
		
		while (x < 10) {
			x++;
			if (x == 5) {
				x += 2;
			}
			x++;
		}
		println(x);
	}
}