#include <stdio.h>

void modifyArray(int *arr, int index, int newValue) {
    arr[index] = newValue;
}

int main() {
    int arr[] = {1, 2, 3, 4, 5};
    int index = 2;
    int newValue = 10;
    
    modifyArray(arr, index, newValue);
    
    printf("\nModified array: ");
    for(int i = 0; i < 5; i++) {
        printf("%d ", arr[i]);
    }
    
    return 0;
}