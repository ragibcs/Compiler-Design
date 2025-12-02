# Manual Testing Guide for Problem 4 Parser

## How to Run Interactive Mode
```bash
cd bison/task/problem4
./test
```

Then type commands one by one and press Enter after each command.

## Sample Commands to Test Manually

### 1. Print Commands
```
print "Hello World"
print "Welcome to the parser"
print "Testing string output"
```

### 2. Variable Assignment
```
set x to 10
set y to 25
set name to 100
set counter to 0
```

### 3. Arithmetic Operations
```
add 5 and 3
add 100 and 200
subtract 10 from 50
subtract 5 from 100
```

### 4. Conditional Statements
```
set age to 30
if age > 18 then print "Adult"

set score to 95
if score > 60 then print "Pass"
if score > 100 then print "Perfect"
```

### 5. Combined Testing
```
set a to 50
set b to 30
if a > b then print "a is greater"
add 10 and 20
subtract 5 from 15
print "Testing complete"
```

### 6. Exit
```
exit
```

## Expected Behavior

- **print "text"** → Outputs the text without quotes
- **set var to num** → Outputs "Set var = num"
- **add X and Y** → Outputs the sum
- **subtract X from Y** → Outputs Y - X
- **if var > num then print "text"** → Prints text if condition is true
- **exit** → Outputs "Exiting..." and terminates

## Tips for Manual Testing

1. Type one command per line
2. Press Enter to execute
3. Commands are case-sensitive (use lowercase keywords)
4. String literals must be in double quotes
5. Variable names can contain letters, numbers, and underscores
6. Use Ctrl+C to force quit if needed
7. Type `exit` for graceful termination
