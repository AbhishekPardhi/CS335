class test_25
{  
    public static void main(String args[])
    {  
		int x = 20;
		float y = 18;
		if (x > y) {
			println("x is greater than y");
		}  

		for (int i = 0; i < 10; i++) {
			x++;
			continue;
			x++;
		}
		
		while(x < 10) {
			x++;
			if( x==5 ){
				x+=2;
				continue;
			}
			x++;
		}
	}
}