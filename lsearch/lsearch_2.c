
int lsearch_2(int* A, int n, int target) {
    int retVal = 0;
    int tempVal = 0;
    int i = 0;
    if (n <= 0) {retVal = -1;}

    else {
        tempVal = A[n-1];
        A[n-1] = target;

        while (A[i] != target) {i = i + 1;}

        A[n-1] = tempVal;
        if (i < (n-1)) {retVal = i;}
        else if (A[n-1] == target) {retVal = (n-1);}
        else {retVal = -1;}
    }
    return retVal;
}

















// int lsearch_2(int *A, int n, int target) {

//     //.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
//     // Question 3(a):  Replace this code with the new algorithm 
//     //.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
//     int i;
//     for (i = 0; i < n; i++) {
//         if (A[i] == target) {
//             return i;
//         }
//     }
//     return -1;
//     //.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
    
// }  // lsearch_2


