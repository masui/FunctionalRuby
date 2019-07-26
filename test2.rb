f = -> (a, b) { a + b + 10 }

puts f.call(1,2)

cf = f.curry

puts cf

g = cf.call(1)

puts g.call(2)
