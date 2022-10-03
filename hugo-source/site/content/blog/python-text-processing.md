---
title: "Python text processing"
date: 2018-11-28T15:15:26+10:00
featured: true
featureImage: images/blog/python.webp
draft: false
weight: 3
---

#  How to do simple text processing tasks with Python

## Introduction 

Python lends itself to easy text processing, string functions, methods
and facilities to deal with text input.

To do great things with text using Python we must know both string
functions and methods that operate on strings and also know your way
around regular expressions.

## What will the reader learn in this article?

In this article you are going to learn 

- Simple text functions/methods in Python
- How to do word, line and character counts like `wc(1)`
- How to search using patterns and replace
- How to iterate a text file and perform string operations line by line
- How to use f strings for printf style output

Python has rich text processing facilities and the above are only a tiny
subset. However the common use cases are covered below. 

You need text processing for many tasks like AI,ML and sentiment
analysis. We could be analyzing access logs on a web server or in a
security log.

Using line based processing, we might detect break in attempts. Using a
web server access log and splitting into fields, we detect traffic
sources, most visited URLs and things that are extremely critical from
an SEO point of view.

### Python text processing

Python has several friendly ways by which you can easily work with text
and we can best learn with some really short but powerful examples.
Python is one of the most expressive languages with economy of
expression. Being a high level language you can get a great deal done
with just few simple lines.

For all these code examples we need to create a sample text file. For
that I normally use the game `fortune` like this.

```shell
$ fortune >> text-sample.txt
$ fortune >> text-sample.txt
$ fortune >> text-sample.txt
$ fortune -l >> text-sample.txt
```

And finally you can check how big a text file is using `wc`.

```shell
$ wc text-sample.txt
  33  352 1940 text-sample.txt
```

Perfect. Now let us read this file and do some text manipulation with each line.

### Simple file I/O

Let us start by reading from the file and printing each line.

``` Python
# Read line-by-line using readline() in a while-loop
f = open('text-sample.txt')
lines = f.readlines()
for line in lines:
   line = line.rstrip()
   print(line)
f.close()

```

The variable f is the file handle using which we can read the lines into
a Python list object. The for loop you see iterates over each line. Once
inside the loop we are simply removing the newline and printing. The
**rstrip()** method removes the last character.

You can however do lot of really simple things with it as we shall see below.

### Do simple splitting of file into lines and words

To split a file into lines all you do is `readlines` like so.

```python
import re
pattern = '\w+'
f = open('text-sample.txt')
lines = f.readlines()
for line in lines:
   line = line.rstrip()
   result = re.findall(pattern, line) 
   print(result)
f.close()
```

But we find that in addition to the steps above we are using regular
expressions to split the line into words. The `\w+` pattern detects each
word in the line. Regular expressions can be really handy for some hard
problems like the `wc` , word count which prints the characters, lines
and words in a text file.

For most cases Python's rich string library will do fine.It is also
important to come up with the right pattern for solving our problem at
hand.

### Do Text trimming

A common task with strings is removing unwanted white space. Leading and
trailing white space can be a pain when trying to process text or create
well structured reports.

```python
teststr='  Quick brown fox jumped over the fence 	'
out = teststr.strip()
print(out)
```

Note that instead of strip, you could use `lstrip` or `rstrip` for
trimming space at left or right end of the string respectively.

String concatenation is another commonly employed technique and python
makes it dead simple. It is simply like numerical addition. If you add
two strings, you find one string beside another. Usually you may want to
add a space in between like so.

```python
a='I am here'
b=' waiting for you'
full = a + b
print(full)
```

Here is the output of above code.

```cmd
I am here waiting for you
```

Python always returns the new string which leaves original string
unmodified. This is the norm. Strings are immutable like tuples. But
that is a separate discussion.

You can use substrings to split a string into several child strings or
substrings. Here are some samples.

```python
teststr='Quick brown fox 835 jumped over the fence'
# Print from offset 3 till 40 (zero based indexing)
print(teststr[3:40])
# from beginning till 20th index
print(teststr[:20])

```

Output of above code is

```cmd
ck brown fox 835 jumped over the fenc
Quick brown fox 835
```

Note that string indices start at 0 and go till length of the string - 1. 
And substrings implicitly use these two(0:len - 1) as the beginning and end of
the substring unless explicitly specified. If you leave out the index at
the beginning of the string then it is assumed to be 0. And if you leave
out the index after ':' then it is assumed to be the last index as
mentioned above.

So you could easily guess what the above does.


### Python regex

Regular expressions are an integral part of any string processing
library. And Python is no different. It comes with a rich cornucopia of
regular expressions which allow you to perform advanced string
operations without specifying the literal value we wish to delimit.

### Some regex examples

Let us look at some examples of using regular expressions.

```python

import re

teststr='Quick brown fox 835 jumped over the fence'
pat = '\d'
res = re.search(pat, teststr)
if res:
   print("Match")
else:
  print("No match")
```

This is just a very simple use of the regular expression `\d` which
stands for any digit. In case the string has the digit we print `match`
and otherwise we say `no match`.

In order to do such a small task, we are using regular expressions to
ensure we understand how to use simple regular expression code before we
get into more complex more challenging problems.

You have a big [laundry list](https://www.programiz.com/python-programming/regex) of regular expressions to match patterns
that look for spaces, printable characters, newlines and so on.

But since Python already has a very strong array of functions without
any regular expression usage I suggest you use that. Unless of course
you absolutely must resort to regex patterns.

Regular expressions are most useful when we cannot know the exact
location of occurrence of a particular entity like a number or
employeeID or some such thing. But it takes more processing power and
memory to use regular expression based string searching and replacing.

Regular expressions are useful in cases where no information is
available on where in a given line a particular entity occurs. But we
must know a lot about the pattern that interests us. One common example
is to remove repeated *the* occurrences in an English text. In fact
regular expressions can also be specified exactly in which we can search
and replace every line where the string *the* occurs more than once. Or
even be more specific and say replace only when it occurs exactly twice.

We have several advanced uses too in which any repeated word occurring
together can be
removed. This uses regex memory or capture in which we do not know which
word is repeated.

Here we see how to do a simple search and replace using regular
expressions.

```python
# first.py
import re

teststr='Quick brown fox 835 jumped over the fence'
pat='\d+'
replace='OLDNUMBER'
newstr = re.sub(pat, replace, teststr)
print(newstr)
```

```python

# second.py
# This does replace using traditional method 
replace='OLDNUMBER'
newstr = teststr.replace('835', replace)
print(newstr)
```

You can yourself test the amount of time it takes to execute the above
two examples using the `time` command on Linux.

For instance you can run 

```cmd
$ time first.py
```

```cmd
$ time second.py
```

You can compare which one performs better or takes less time.

Perhaps you will learn regex syntax sometime. Till then you can code
without using regular expression patterns.

The above code can be very helpful as this can be a great labor
saving device if you have 1000s or millions of patterns to be replaced
at one go.

Regular expressions help us when what we are looking for
has a regularity of occurrence, when the characteristics of the text
entity are known( non printable characters, digits, unicode, line feed).

In certain cases the field separator location or even exact
locations in a line like beginning , end, after certain spaces or tabs
may not be known. Regex pattern is the way to go when we know only about
the field/word we want.

Remember that regular expressions almost always work with lines and in
fact most of this article is also trying to break down a text file into
lines and work with one line at a time.

```python
teststr='''This is a nice day. This is a good time for fun. How about a '
        fishing expedition?'''
res = teststr.replace(' a ', ' no ');
print(teststr);
print(res);
```

Above code shows a simple search and replace **without** using regular
expressions.

## Advanced use of python text facilities


Python does give you some really nifty string methods which are nothing
 but string object invocations that work on the string in question.

This is not same as string functions which are invoked without a `.`.

Here are some examples of string methods.

```python
teststr='Quick brown fox 835 jumped over the fence'
len(teststr)
out = teststr.strip()
print(out)
out = teststr.upper()
print(out)
count = teststr.count(' ')
print(count)

```

The above code does what the English word that stands for the python
keywords actually mean. The **strip()** method removes white spaces from
the beginning and end of the string. The **upper()** method converts all
characters to uppercase. For instance *mango* becomes *MANGO*.

The **count()** method counts all occurrences of the character we give
it as argument. In this case, we are only counting the SPACE characters.
You can count for any character you give as argument. For instance if
you want to know how many times the alphabet `a` is repeated you can run
**count('a')** to know.

The fact that most methods have an intuitive English name
 makes python a really beginner friendly
and intuitive programming language as well.

Kindly note that instead of using functions we use methods as `.` is
used on the string object directly in above case the `teststr` string
object.

## Implementing a simple file I/O and line iteration 

Now that we have got ourselves warmed up with some processing
samples in Python, let us build a fairly functional code to read a
text file and perform a function with it.

``` Python
import re
pat = ' \d+ '
with open('text-sample.txt', 'r') as f:  
    for line in f:           
        isFound = re.search(pat, line)
        if isFound:
          print("Pattern found in file")
          break
```
This sample looks for a number with more than one digit. If found we
break out of the loop in favor of efficiency.

As you can see from above, the `with` keyword is used instead of other
ways we used above. This is the canonical way to work with files as it
lends to more efficient and neat code.

We can use any method to read files as per our convenience. The above
method is more efficient for processing big files as it is an iterative
method. The readlines() method we saw above slurps entire file into a Python object.

### Convert binary output to UTF-8 and vice versa

Python strings also support UTF-8 conversion and we also have a byte
object which is very similar to string object but with some differences.

A byte object can store any binary data, unprintable characters, wide
strings and Cyrillic or foreign language strings.

If you find the `b' ` prefix in any print line, then it means that
instead of a string object this is a byte object.

You can usually get a string object out of a bytes object by using the
`str` function. And you can get a bytes object from a string object
using

```python
bytestr = bytes('i am a string', 'utf-8')
print(bytestr)
strout = str(bytestr, 'utf-8')
print(strout)
```

Usually it is pretty obvious if you are dealing with string or byte
object. Byte strings start with a `b'` .

### How to do word line and character counts?

It is quite easy to get a `wc` style functionality with python.


```python

import re

f = open('text-sample.txt')
lines = f.readlines() 
f.close()
chrcount = 0
wordcount = 0
pat='\S+'
for line in lines:
  chrcount += len(line)
  wordcount += len(re.findall(pat, line))

linecount=len(lines)
print(f' The character count is {chrcount}')
print(f' The word count is {wordcount}')
print(f' The line count is {linecount}')

```

We see it concurs with what we saw in `wc test-sample.txt` above.

It is trivial to get your job done once you get a hang of its functions
and get your hands dirty with some sample code.

But the pattern we use above is significant.We are looking for non space
characters(`\S`) and the `+` character means one or more occurrences.

### Some niceties and how to chain common text processing tasks

As python is 100% object oriented and each operation returns another
object most of the time, we can chain together some object methods in
interesting ways. This is left to your own creativity but here are some
samples to get your creative juices flowing.

```python
teststr='Quick brown fox 835 jumped over the fence'
result = teststr.upper().split(' ')
print(result)
```
This leads to really expressive short statements that do a lot.


### Convert string to int and vice versa

In order to convert a character to integer and vice versa you can use
these functions(not methods).

```python
char='e'
intval = ord(char)
charval = chr(intval)
print(charval)
print(intval)
```

As computers always store integer values internally they are converted
into ASCII during processing.

### What are f strings?

Long ago Python used to have plenty of methods to format and print text.
This requires a lot of work as you need to interpolate string variables
and convert from string to integer, do floating point precision
arithmetic and other formatting nits like left aligned, right aligned
output and so on.

In order to get such a messy thing ironed out Python now supports what
are known as f strings.

They look like this.

```python
teststr='Demo of f strings '
a='mango'
b='apple'
print(f'{teststr} and {a} with {b}')

```
The above interpolates the value of `teststr`, `a` and `b` and you get a
neatly organized output reminiscent of **C printf()** statement.

You also have multi line f strings and nothing stops you from using
triple quotes inside f strings as well.

Formerly, Python code was filled with too many percentage characters that
quickly confused a code walk through. But today almost all new python
code uses f strings to format output.

## Conclusion 

Python, as we saw above, is incredibly powerful, expressive, efficient and
gets the job done with very little code. And text is one of its
strengths and this article only scratched the surface about its rich
possibilities.

In this article we saw how we can leverage Python's string functions and
methods to achieve common goals that programmers and non programmers
face and how to augment one's python coding skills to be more effective
at work.

Even with regular expressions Python does a great job. Though most jobs
should not require them, as they are slower and more complex some search
and replace tasks are best done using regex.

We also saw how to use Python to get by with simple file I/O loop and
string functions and methods. :smile:

---
