# Number Theory: Subtraction

In this lab you've learned the basics of number theory as it relates to subtraction.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Paul, Brian 
Group 15

## Summary
We implemented a modified half-adder. The half-subtractor. This was done by changing how the carry vs borrow is implemented. 
We implemented a 1s complement addtion full adder. We had to figure out how to do the end-around carry without entering into an infinite loop. 
We implemented a 2s complement converter. We had to figure out a clean way to flip the bits (convert to 1s complement form) and then add 1 (convert from 1s complement to 2s). 

## Lab Questions

### 1 - Explain the differences between our Half Adder from last lab and the Half Subtractor from this lab.
The difference is how the "borrow" or "carry" is implemented. On the half-adder the carry out is the AND of the two inputs. While on the half-sub the borrow is the result of (~A & B). 

### 2 - What about the end around carry of One’s Complement makes it hard to use and implement?
The end around carry has to be implemented in a second stage. If the arithmetic is implemented in one stage the logic enters an infinite loop. Where the MSB is reliant on the LSB and waiting for input, while the LSB depends on the MSB and is waiting on its input. 

### 3 - What is the edge case and problem with Two’s Complement number representation?
There is a mismatch in the possible positive numbers and possible negative numbers. A 4 bit 2s complement number can only go from -8 to +7, and is unable to go to +8. 