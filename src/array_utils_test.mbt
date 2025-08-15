///|
test "sum" {
  let arr = [1, 2, 3, 4]
  assert_eq(arr_sum(arr), 10)
  let empty : Array[Int] = []
  assert_eq(arr_sum(empty), 0)
}

///|
test "zero_arr" {
  let arr : Array[Int] = zero_arr(5)
  assert_eq(arr, [0, 0, 0, 0, 0])
}

///|
test "reverse" {
  let arr = [1, 2, 3, 4]
  inspect(reverse(arr), content="[4, 3, 2, 1]")
  inspect(reverse([1]), content="[1]")
}

///|
test "reverse_inplace" {
  let mut arr = [1, 2, 3, 4]
  reverse_inplace(arr)
  inspect(arr, content="[4, 3, 2, 1]")
  arr = [1]
  reverse_inplace(arr)
  inspect(arr, content="[1]")
}

///|
test "find" {
  let arr = [1, 2, 3, 4]
  inspect(find(arr, fn(x) { x == 3 }), content="Some(3)")
  inspect(find(arr, fn(x) { x == 5 }), content="None")
}

///|
test "same_to" {
  let arr_not_same = [1, 2, 3, 4]
  let arr_same_one = [1, 1, 1, 1]
  let arr_same_two = [2, 2, 2, 2]
  assert_eq(same(arr_not_same), false)
  assert_eq(same(arr_same_one), true)
  assert_eq(same(arr_same_two), true)
  assert_eq(same_to(arr_not_same, 1), false)
  assert_eq(same_to(arr_same_one, 1), true)
  assert_eq(same_to(arr_same_two, 2), true)
  assert_eq(map_same(arr_not_same, fn(x) { x - x }), true)
  assert_eq(map_same_to(arr_same_one, fn(x) { x * 2 }, 2), true)
}
