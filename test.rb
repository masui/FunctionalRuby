
def to_boolean(proc)
  proc[true][false]
end

#
# xに対してpをn回適用するprocをZEROとかONEとかで定義している
#
# ZERO =  -> p,x { x }
# ONE =   -> p,x { p[x] }
# TWO =   -> p,x { p[p[x]] }

def to_number(proc)
  proc[-> v { v + 1 }][0]
end

# puts to_number(TWO)


ZERO =  -> p { -> x { x } }
ONE =   -> p { -> x { p[x] } }
TWO =   -> p { -> x { p[p[x]] } }
# 3 := λf x. f (f (f x))
THREE = -> p { -> x { p[p[p[x]]] } }

# SUCC := λn f x. f (n f x)
# SUCC := λn p x. p (n p x)

succ = ->n{->p{->x{p[n[p][x]]}}}

# succ = -> p { -> x { p[x] }}

FOUR = succ[THREE]
FIVE = succ[FOUR]

puts to_number(FIVE)



# plus = λmnfx. m f (n f x)
plus = -> m { -> n { -> f { -> x { m[f][n[f][x]] }}}}

SEVEN = plus[FOUR][THREE]
puts to_number(SEVEN)

exit


# SUCC := λn f x. f (n f x)



TRUE = -> x { -> y { x } }
FALSE = -> x { -> y { y } }

# TRUE, FALSEはふたつ引数をとってどちらかを返すProc

# puts TRUE[10+20]['def']

# TRUE = -> x, y { x }
# FALSE = -> x, y { y }

IS_ZERO =  -> n { n[-> x { FALSE }][TRUE] }

puts to_boolean(IS_ZERO[ZERO])
puts to_boolean(ZERO[-> x { FALSE }][TRUE])
puts to_boolean((-> x { x })[TRUE])
# => true

puts to_boolean IS_ZERO[ONE]
puts to_boolean ONE[-> x { FALSE }][TRUE]
puts to_boolean (-> x { (-> x { FALSE })[x]})[TRUE]
puts to_boolean (-> x { FALSE })[TRUE]
# => false

exit


puts to_boolean(IS_ZERO[ZERO])
exit


# Rubyの数などに変換するメソッド
def to_number(proc)
  proc[-> v { v + 1 }][0]
end

# pow = -> proc { proc[-> v { v * 2 }][1] }

def pow(proc) proc[-> v { v * 2 }][1] end
puts pow(THREE)

exit


# def to_boolean(proc)
#   proc[true][false]
# end

puts to_boolean(FALSE)

puts to_number(THREE)

puts to_boolean(IS_ZERO[THREE])


IF = -> b { b }

puts to_boolean(TRUE)
puts to_boolean(FALSE)


puts IF[TRUE]['happy']['sad']
puts IF[TRUE]['happy','sad']

puts IF[IS_ZERO[THREE]]['THREE IS ZERO']['THREE IS NOT ZERO']


