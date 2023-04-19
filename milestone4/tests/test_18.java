class Main{

    public static int add(int first, int second) {
        int sum = first + second;
        return sum;
    }

    public static void main(String arg[]) {

        int first = 10;
        int second = 20;

        // add two numbers
        int sum = add(first, second);
        println(sum);
    }
}