#
# チャーチ数というものらしい
# https://ja.wikipedia.org/wiki/ラムダ計算
# https://en.wikipedia.org/wiki/Church_encoding
# https://uid0130.blogspot.com/2013/05/x.html
#
# パズル的に面白いが全然ワカランし、何か用途はあるんだろうか?
#

#
# 3 = λfx. f (f (f x) 
#
ZERO   = -> f { -> x { x }}
ONE    = -> f { -> x { f[x] }}
TWO    = -> f { -> x { f[f[x]] }}
THREE  = -> f { -> x { f[f[f[x]]] }}

#
# 数字を表示する
#
number = -> f { f[-> v { v+1 }][0] }

# succ = λnfx. f(n f x)
# ペアノの公理?
#
succ   = -> n { -> f { -> x { f[n[f][x]] }}}
FOUR   = succ[THREE]
FIVE   = succ[FOUR]
p number[FIVE]   # => 5

# plus = λmnfx. m f (n f x)
#
plus   = -> m { -> n { -> f { -> x { m[f][n[f][x]] }}}}
SIX    = plus[TWO][FOUR]
p number[SIX]    # => 6

# mult = λmn. m (plus n) 0
#
mult = -> m { -> n { m[plus[n]][ZERO] }}
TWENTY = mult[FOUR][FIVE]
p number[TWENTY] # => 20
  
