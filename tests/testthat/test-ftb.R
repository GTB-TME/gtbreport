test_that("Returning error for non-numeric input works", {
  expect_error(ftb("blah"), "Input must be numeric")
})

test_that("Returning en-dash for NA or numbers outside the range works", {
  expect_equal(ftb(NA), "–")
  expect_equal(ftb(2e9), "–")
  expect_equal(ftb(2.01e9), "–")

})

test_that("Returning zero works", {
  expect_equal(ftb(0), "0")
  expect_equal(ftb(0.0), "0")
  expect_equal(ftb(-0.0), "0")
})

test_that("Returning values under 0.1 as '<0.1' works", {
  expect_equal(ftb(0.0001), "<0.1")
  expect_equal(ftb(0.01), "<0.1")
  expect_equal(ftb(0.0949), "<0.1")
})

test_that("Returning values from 0.1 to <1 as 0.NN works", {
  expect_equal(ftb(0.099), "0.10")
  expect_equal(ftb(0.104), "0.10")
  expect_equal(ftb(0.1444), "0.14")
  expect_equal(ftb(0.145), "0.14")
  expect_equal(ftb(0.1488), "0.15")
  expect_equal(ftb(0.994), "0.99")
})

test_that("Returning values from 1 to <10 as N.N works", {
  expect_equal(ftb(0.995), "1.0")
  expect_equal(ftb(1.45), "1.4")
  expect_equal(ftb(1.46), "1.5")
  expect_equal(ftb(9.46), "9.5")
  expect_equal(ftb(9.94), "9.9")
  expect_equal(ftb(9.949), "9.9")
})

test_that("Returning values from 10 to <100 as NN works", {
  expect_equal(ftb(9.95), "10")
  expect_equal(ftb(19.95), "20")
  expect_equal(ftb(99.49), "99")

})

test_that("Returning values from 100 to <1000 as NNN works", {
  expect_equal(ftb(99.5), "100")
  expect_equal(ftb(199.5), "200")
  expect_equal(ftb(456.789), "457")
  expect_equal(ftb(999.49), "999")
})

test_that("Returning values from 1000 to <1e4 as NNN0 (3 sig figs with no thousands separator) works", {
  expect_equal(ftb(999.5), "1000")
  expect_equal(ftb(1234.56), "1230")
  expect_equal(ftb(2345.67), "2350")
  expect_equal(ftb(9994), "9990")
})

test_that("Returning values from 1e4 to <2e9 as N NN0 000 (3 sig figs, with non-breaking space thousands separator) works", {
  expect_equal(ftb(9995), "10 000")
  expect_equal(ftb(123456), "123 000")
  expect_equal(ftb(9.999e8), "1 000 000 000")
  expect_equal(ftb(1.999e9), "2 000 000 000")

})

