///|
/// Constrains a value of any comparable type within a specified range [minimum,
/// maximum].
///
/// Parameters:
///
/// * `value` : The value to be clamped.
/// * `minimum` : The lower bound of the range (inclusive).
/// * `maximum` : The upper bound of the range (inclusive).
///
/// Returns the clamped value:
///
/// * If `value` is less than `minimum`, returns `minimum`.
/// * If `value` is greater than `maximum`, returns `maximum`.
/// * Otherwise, returns `value` unchanged.
///
/// Examples:
/// - clamp(5, 0, 10) returns 5
/// - clamp(-1, 0, 10) returns 0
/// - clamp(15, 0, 10) returns 10
pub fn[T : Compare] clamp(value : T, min : T, max : T) -> T {
  if value < min {
    min
  } else if value > max {
    max
  } else {
    value
  }
}

///|
/// Checks if a value is within a closed interval [minimum, maximum].
///
/// Parameters:
///
/// * `value` : The value to check.
/// * `minimum` : The lower bound of the interval (inclusive).
/// * `maximum` : The upper bound of the interval (inclusive).
///
/// Returns `true` if the value is greater than or equal to `minimum` and less
/// than or equal to `maximum`, `false` otherwise.
///
/// Examples:
/// - is_between(5, 0, 10) returns true
/// - is_between(-1, 0, 10) returns false
/// - is_between(15, 0, 10) returns false
pub fn[T : Compare] is_between(value : T, min : T, max : T) -> Bool {
  value >= min && value <= max
}
