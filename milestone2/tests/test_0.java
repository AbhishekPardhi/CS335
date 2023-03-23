/*  Multidimensional Array */
class MultidimensionalArray {
    public static void main(String[] args) {

        int[][] a = {
            {1, -2, 3}, 
            {-4, -5, 6, 9}, 
            {7}, 
        };
      
        for (int i = 0; i < 10; ++i) {
            for(int j = 0; j < 10; ++j) {
                a[i][j]=69;
            }
        }
    }
}