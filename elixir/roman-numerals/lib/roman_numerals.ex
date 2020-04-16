defmodule RomanNumerals do

  def values() do
    [
     {1000, "M" },{900, "CM"},{500, "D" },{400, "CD"},{100, "C" },
     {  90, "XC"},{ 50, "L" },{ 40, "XL"},{ 10, "X" },{  9, "IX"},
     {   5, "V" },{  4, "IV"},{  1, "I" }
    ]
  end

  def numeral(num) do
    roman = ""
    [{dec, rom} | list] = values()
    build(num, roman, {dec, rom}, list)
  end

  def build(num, roman, {_dec, _rom}, _list) when num == 0,  do: roman
  def build(num, roman, { dec,  rom},  list) when dec <= num do
    num = num - dec
    roman = roman <> rom
    build(num, roman, {dec, rom}, list)
  end
  def build(num, roman, {_dec, _rom},  list)                 do
    [{dec, rom} | newlist ] = list
    build(num, roman, {dec, rom}, newlist)
  end

end





