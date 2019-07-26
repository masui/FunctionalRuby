#
# チャーチ数というものらしい
# https://ja.wikipedia.org/wiki/ラムダ計算
# https://uid0130.blogspot.com/2013/05/x.html
#

# 3 = λfx. f (f (f x) 

ZERO   = -> p { -> x { x }}
ONE    = -> p { -> x { p[x] }}
TWO    = -> p { -> x { p[p[x]] }}
THREE  = -> p { -> x { p[p[p[x]]] }}

succ   = -> n { -> p { -> x { p[n[p][x]] }}}
FOUR   = succ[THREE]
FIVE   = succ[FOUR]

plus   = -> m { -> n { -> f { -> x { m[f][n[f][x]] }}}}
SIX    = plus[TWO][FOUR]

number = -> p { p[-> v { v+1 }][0] }

p number[FIVE] # => 5
p number[SIX]  # => 6


  

  
