public class MultiDimensionalArrayExample {
    public static void main(String[] args) {
        int[][] arr = new int[3][2];

        arr[0][0] = 1;
        arr[0][1] = 2;
        arr[1][0] = 3;
        arr[1][1] = 4;
        arr[2][0] = 5;
        arr[2][1] = 6;

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 2; j++) {
                println(arr[i][j]);
            }
        }
    }
}