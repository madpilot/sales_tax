# Sales Tax

## Installing

Run ```bundle install```

## Running

sales_tax takes one argument: the filename of the input file.

Eg input1.txt:

```text
Quantity, Product, Price! 1, book, 12.49!
1, music cd, 14.99!
1 chocolate bar, 0.85!
```

```bin/sales_tax input1.txt```

## Notes

1. I'm using the new RSpec syntax, as the one in those guidelines are deprecated
1. I'm ingnoring the case change of "music CD" in the output of Output 1
