mylist = list(range(4))
seclist = mylist
print(seclist)
mylist.append(4)
print(seclist)
seclist = mylist[:]
print(seclist)
mylist.append(5)
print(seclist)

def f(n):
  for x in range(n):
    yield x**3

for x in f(6):
  print(x)

counter = 1
def dolots(count):
  global counter
  for i in (1, 2, 3):
    counter = count + i

c=dolots(4)
#print(c)
print(counter)

import json

text  = """<bookstore shelf="New Arrivals">
  <book category="COOKING">
    <title lang="en">Everyday Italian</title>
    <author>Giada De Laurentiis</author>
    <year>2005</year>
    <price>30.00</price>
  </book>
  <book category="CHILDREN">
    <title lang="en">Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
  </book>
  <book category="WEB">
    <title lang="en">Learning XML</title>
    <author>Erik T. Ray</author>
    <year>2003</year>
    <price>39.95</price>
  </book>
</bookstore>"""

conv = json.load(text)
print(conv)