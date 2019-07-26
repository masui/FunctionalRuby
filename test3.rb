#
# チャーチ数というものらしい
# https://ja.wikipedia.org/wiki/ラムダ計算
# https://uid0130.blogspot.com/2013/05/x.html
#

# 3 = λfx. f (f (f x) 

ZERO   = -> f { -> x { x }}
ONE    = -> f { -> x { f[x] }}
TWO    = -> f { -> x { f[f[x]] }}
THREE  = -> f { -> x { f[f[f[x]]] }}

# succ = λnfx. f(n f x)
# ペアノの公理?

succ   = -> n { -> f { -> x { f[n[f][x]] }}}
FOUR   = succ[THREE]
FIVE   = succ[FOUR]

# plus = λmnfx. m f (n f x)

plus   = -> m { -> n { -> f { -> x { m[f][n[f][x]] }}}}
SIX    = plus[TWO][FOUR]

# mult = λmn. m (plus n) 0
mult = -> m { -> n { m[plus[n]][ZERO] }}
TWENTY = mult[FOUR][FIVE]

number = -> f { f[-> v { v+1 }][0] }

p number[FIVE]   # => 5
p number[SIX]    # => 6
p number[TWENTY] # => 20
  

  
