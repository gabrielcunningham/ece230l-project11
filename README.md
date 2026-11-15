# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Section 2, Group 6: Gabe and Everett

## Summary
In this lab, we implemented different methods of slowing down a clock signal.
The first thing we tried was creating a modulo counter using full adders and
D-latch. This is a more accurate, synchronous way of doing this. However, 
counting can also be done with less components by using T-flipflops but it is
not fully synchronous.

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
The modulo counter holds the value for the whole clock cycle, meaning every
up/down cycle of the output clock will be exactly 2 clock cycles because the 
latches hold the value for one full clock cycle. So if you hold it for N cycles
it is therefore 2\*N.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
The ripple counter's output goes to all 1s on the first clock cycle because it
starts at 0 in every T-flipflop in the circuit, but since it counts down, it
overflows to all 1s.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
The Basys 3 board has a 100MHz (= 100,000KHz) crystal oscillator.
$$
\frac{100,000\text{KHz}}{1\text{KHz}}=100,000\text{ Scale Factor}
\newline
\log_2(100,000) \approx 16.61
\newline
\text{ceil}(16.61)=17
$$
The ripple counter would need to be at least 17 bits wide.
