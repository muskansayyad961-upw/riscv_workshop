# Day 1
## Binary Number System

The binary number system uses only two digits: **0** and **1**. A single binary digit is called a **bit**. A group of 8 bits forms a **byte**, 32 bits form a **word**, and 64 bits form a **double word**. For an n-bit binary number, the total number of possible combinations is **2ⁿ**.

## Unsigned Numbers

Unsigned binary numbers represent only **non-negative values (0 and positive integers)**. They do not contain a sign bit. For example, `00000001` represents the decimal value **1**.

## Signed Numbers

Signed binary numbers use the **Most Significant Bit (MSB)** to indicate the sign of the number. An MSB of **0** represents a positive number, while an MSB of **1** represents a negative number. For example, in the 8-bit number `10000010`, the MSB is `1`, indicating a negative value.
##code for day 1
```#include <stdio.h>

int main() {
int i, sum = 0, n = 9;
for (i=1; i <= n; ++i) {
sum += i; }
printf("Sum of numbers from 1 to %d is %d\n", n, sum);
return 0;

}
```
##  image1

![image1](Images/labday1.jpeg)

