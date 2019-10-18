# ruby_cisco_solution README

Hi! This repository is my solution to the coding exercise I received from Cisco. I was asked to implement a simple functionality in any Object Oriented language.

# Exercise Description

Given a comma separated list of words in a single file, return the number of times the word was
seen.
The input will be in the form of a text file
## Example input:
green,green,red,green,red
## Expected output:
green,3
red,2
## Guidelines:
- Free to use any modern programming language that is object oriented compatible
- Please include documentation on how to compile or run your program
- Please write unit tests for your code
- Include documentation on how to run the tests


# My Solution 

## File description

Two ruby files (main.rb and test.rb) and four txt files (empty.txt, long.txt, new.txt, and super_long.txt), and a zip file are included. More file description is as follows:

### main.rb

This is the main ruby file that implements the desired result. There is a WordCounter class which has an initialize method to initialize the file name, a count method which returns a string if the file name is nil, or the file is empty, or the file name doesn't exits (different string is returned for each case) or returns a Hash in other cases, and a process_output method which returns a string based on what is returned from the count method.

I have also added some code to run the class WordCounter, which is included below the WordCounter class.

You can do as follows to get the desired result:
1. Create an object by using WordCounter.new (eg: **wc_abc=WordCounter.new('abc.txt')** )
2. Create the counter by calling the count method (eg: **counter_abc=wc_abc.count** )
3. Display the output (eg: **puts wc_abc.process_output(counter_abc)**)


### test.rb

This is for the unit test. This file inherits from Test::Unit::TestCase. This file initialized six instance variables to test six different scenarios. 
#### Test scenarios
A. User entered a file name of a file which is empty.
B. User didn't enter a file name (file name = nil).
C. User entered a file name of a file which doesn't exist.
D. User entered a file name of a file which contains only 10 words.
E. User entered a file name of a file which is rather long (6000 words)
F. User entered a file name of a file which is very long (60000000 words)

This file has implemented 4 tests:

#### Tests
1. Test the return type of count method ( A, B, C above should return a string, while D, E, F should return a Hash).
2. Test the return value of count method (Verifies if A, B, C returns the desired string, and if D, E, F has the returned value for each key, also that D, E, F doesn't have any random keys)
3. Test the return type of process_output(A to F should return a string)
4. Test the return value of process_output( Verifies if A, B, C returns the desired string, and if the returned string of D, E, F includes the desired value for each key, also if the returned string of D, E, F doesn't have any random value for a specific word)

### new.txt

This txt file was manually created, and only contained 10 words.

### long.txt

This txt file was created by writing to a file in Ruby to verify that the functionality still works when there is a long string in the file. It was created to have 6000 words, separated by **comma** .

### empty.txt

This txt file is empty.

### super_long.txt

This txt file was created by writing to a file in Ruby to verify that the functionality still works when there is a long string in the file. 

It was created to have 60000000 words, separated by **comma** .

Due to the fact that the original super_long.txt is almost 400 MB, I couldn't push it to the repository. 

I have included a zip file which includes all the files in the repository. You can download the zip file and extract the txt file.

### cisco_ruby_project.zip

A zip file which included all the files (I have pushed the zip file because I was unable to push the super_long.txt file, which is of almost 400 MB).

## Running the rb file

To run a rb file called **_abc.rb_**, open terminal and change the working directory to where the rb file is, run **_ruby abc.rb_**. 

## Running the test file

Open the terminal and change to the working directory to where test.rb file is, run **_ruby test.rb_** .

# Limitations of my solution

Due to the limited time frame and the fact that I am still not familiar with Ruby, my solution still has some limitations.
1. I didn't test the solution against a text file which has multiple words (like this README file that you are reading).
2. There might be some cases that I didn't cover in the main.rb for the functionality implemented, or some test cases that I ignored.
3. The running of test.rb takes over 8 minutes (Maybe there is some way to optimize its running time that I am not aware of). 

