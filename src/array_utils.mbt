/// Array utilities for common operations
/// 
/// This module provides utility functions for common array operations
/// including mathematical operations, transformations, and searches.

///|
/// Sums all elements in an array using the Add operation.
/// For Int type, this computes the sum of integers.

///|
test "arr_sum" {
  let nums = [1, 2, 3, 4]
  inspect(arr_sum(nums), content="10")
}

///|
pub fn arr_sum(arr : Array[Int]) -> Int {
  arr.fold(fn(acc, x) { acc + x }, init=0)
}

///|
/// Computes the sum of absolute values in an array.
/// For numeric types that support absolute value operations.
/// 
/// # Example
/// ```moonbit
/// let nums = [-1, 2, -3, 4]
/// arr_abs_sum(nums) // Returns 10
/// ```

///|
test "arr_abs_sum" {
  let nums = [-1, 2, -3, 4]
  inspect(arr_abs_sum(nums), content="10")
}

///|
pub fn arr_abs_sum(arr : Array[Int]) -> Int {
  let abs = fn(x) { if x < 0 { -x } else { x } }
  arr.fold(fn(acc, x) { acc + abs(x) }, init=0)
}

///|
/// Creates an array of zeros for a given type and size.
/// The type must support providing a zero value.
/// 
/// # Parameters
/// - `n`: Size of the array to create
/// 
/// # Returns
/// An array of size `n` filled with zero values
/// 
/// # Example
/// ```moonbit
/// let int_zeros = zero_arr(3)    // [0, 0, 0]
/// let double_zeros = zero_arr_double(2) // [0.0, 0.0]
/// ```

///|
test "zero_arr" {
  let int_zeros : Array[Int] = zero_arr(3)
  inspect(int_zeros, content="[0, 0, 0]")
}

///|
pub fn zero_arr(n : Int) -> Array[Int] {
  Array::make(n, 0)
}

///|
/// Reverses an array, creating a new array with elements in reverse order.
/// 
/// # Parameters
/// - `arr`: The input array to reverse
/// 
/// # Returns
/// A new array with elements in reverse order

///|
test "reverse" {
  let nums = [1, 2, 3, 4]
  inspect(reverse(nums), content="[4, 3, 2, 1]")
  let empty : Array[Int] = []
  inspect(reverse(empty), content="[]")
}

///|
pub fn[A] reverse(arr : Array[A]) -> Array[A] {
  let len = arr.length()
  if len == 0 {
    return []
  }
  let result = Array::make(len, arr[0])
  for i = 0; i < len; i = i + 1 {
    result[i] = arr[len - 1 - i]
  }
  result
}

///|
/// Reverses an array in-place, modifying the original array.
/// 
/// # Parameters
/// - `arr`: The array to reverse in-place

///|
test "reverse_inplace" {
  let nums = [1, 2, 3, 4]
  reverse_inplace(nums)
  inspect(nums, content="[4, 3, 2, 1]")
  let empty : Array[Int] = []
  reverse_inplace(empty)
  inspect(empty, content="[]")
}

///|
pub fn[A] reverse_inplace(arr : Array[A]) -> Unit {
  let len = arr.length()
  for i = 0; i < len / 2; i = i + 1 {
    let temp = arr[i]
    arr[i] = arr[len - 1 - i]
    arr[len - 1 - i] = temp
  }
}

///|
/// Finds the first element in an array that satisfies a predicate.
/// 
/// # Parameters
/// - `arr`: The array to search
/// - `predicate`: A function that returns true for the desired element
/// 
/// # Returns
/// `Some(element)` if found, `None` otherwise

///|
test "find" {
  let nums = [1, 2, 3, 4, 5]
  inspect(find(nums, fn(x) { x > 3 }), content="Some(4)")
  inspect(find(nums, fn(x) { x > 10 }), content="None")
}

///|
pub fn[A] find(arr : Array[A], predicate : (A) -> Bool) -> A? {
  for i = 0; i < arr.length(); i = i + 1 {
    let element = arr[i]
    if predicate(element) {
      return Some(element)
    }
  }
  None
}

///|
/// Checks if all elements in an array are the same.
/// 
/// # Parameters
/// - `arr`: The array to check
/// 
/// # Returns
/// `true` if all elements are equal, `false` otherwise

///|
test "same" {
  inspect(same([1, 1, 1, 1]), content="true")
  inspect(same([1, 2, 1, 1]), content="false")
}

///|
pub fn[A : Eq] same(arr : Array[A]) -> Bool {
  if arr.length() <= 1 {
    return true
  }
  let first = arr[0]
  for i = 1; i < arr.length(); i = i + 1 {
    if arr[i] != first {
      return false
    }
  }
  true
}

///|
/// Applies a function to each element and checks if all results are the same.
/// 
/// # Parameters
/// - `arr`: The input array
/// - `f`: Function to apply to each element
/// 
/// # Returns
/// `true` if the function returns the same value for all elements

///|
test "map_same" {
  let words = ["hello", "world", "test"]
  inspect(map_same(words, fn(s) { s.length() }), content="false")
  let numbers = [1, 3, 5]
  inspect(map_same(numbers, fn(x) { x % 2 }), content="true")
}

///|
pub fn[A, B : Eq] map_same(arr : Array[A], f : (A) -> B) -> Bool {
  if arr.length() <= 1 {
    return true
  }
  let first_result = f(arr[0])
  for i = 1; i < arr.length(); i = i + 1 {
    if f(arr[i]) != first_result {
      return false
    }
  }
  true
}

///|
/// Checks if all elements in an array are equal to a specific value.
/// 
/// # Parameters
/// - `arr`: The array to check
/// - `value`: The value to compare against
/// 
/// # Returns
/// `true` if all elements equal the value, `false` otherwise

///|
test "same_to" {
  inspect(same_to([5, 5, 5], 5), content="true")
  inspect(same_to([5, 4, 5], 5), content="false")
}

///|
pub fn[A : Eq] same_to(arr : Array[A], value : A) -> Bool {
  for element in arr {
    if element != value {
      return false
    }
  }
  true
}

///|
/// Applies a function to each element and checks if all results equal a value.
/// 
/// # Parameters
/// - `arr`: The input array
/// - `f`: Function to apply to each element
/// - `value`: The value to compare results against
/// 
/// # Returns
/// `true` if the function returns the same value for all elements

///|
test "map_same_to" {
  let words = ["aa", "bb", "cc"]
  inspect(map_same_to(words, fn(s) { s.length() }, 2), content="true")
  inspect(map_same_to(words, fn(s) { s[0] }, 'a'), content="false")
}

///|
pub fn[A, B : Eq] map_same_to(arr : Array[A], f : (A) -> B, value : B) -> Bool {
  for element in arr {
    if f(element) != value {
      return false
    }
  }
  true
}
