# Sales Tax

## Installing

Run ```bundle install```

## Running

sales_tax takes one argument: the filename of the input file.

Eg input1.txt:

```text
Quantity, Product, Price
1, book, 12.49
1, music cd, 14.99
1 chocolate bar, 0.85
```

Then run:

```bin/sales_tax input1.txt > output1.csv```


## Testing

Run ```rspec```

## Notes

1. I'm using the new RSpec syntax, as the one in those guidelines are deprecated
1. I'm ingnoring the case change of "music CD" in the output of Output 1
1. Requires Ruby 2.x+
1. Outputs a CSV on STDOUT
