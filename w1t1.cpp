/*task 1a: 
create a pointer to the local variable n called ptr_to_n
use it to inc the val of n by 1.
print the result

#include <iostream>
using namespace std;

int main() {
    int n = 0; 
    int* ptr_to_n = &n;
    (*ptr_to_n)++;
    cout << n << endl;
    return 0;
}*/

/*task 1b: 
create an array that has 3 elements (10, 30, 2000)
declare a pointer to that array
then a loop that iterates throught the array, printing each element
+ the pointer of that element 

#include <iostream>
using namespace std;

int main() {
    int arr[3] = {10, 30, 2000};
    int* ptr = arr;

    for (int i = 0; i < 3; i++) {
        cout << "Element: " << *(ptr + i)
             << " | Address: " << (ptr + i) << endl;
    }

    cout << "\nCHECK: it worked" << endl;
    return 0;
}*/

/*task 1c:
implement a function that takes 2 ptrs to the same type
along with a len parameter
if the ptrs are not null then check that the elements are the same
for length, + return true (1) else false (0)
write a main function to test your function

#include <iostream>
using namespace std;

bool sameElements(int* ptr1, int* ptr2, int length) {
    // checking if either pointer is null
    if (ptr1 == nullptr || ptr2 == nullptr) {
        return false;
    }

    // checking each element
    for (int i = 0; i < length; i++) {
        if (ptr1[i] != ptr2[i]) {
            return false;
        }
    }
    return true;
}

int main() {
    int arr1[3] = {10, 30, 2000};
    int arr2[3] = {10, 30, 2000};
    bool result = sameElements(arr1, arr2, 3);

    // easy check
    if (result) {
        cout << "CHECK: TRUE - arrays are the same" << endl;
    } else {
        cout << "CHECK: FALSE - arrays are different" << endl;
    }
    return 0;
}*/
