test_that("Returning error for non-numeric input works", {
  expect_error(ftb("blah"), "Input must be numeric")
})

test_that("Returning NA works", {
  expect_equal(int_spacer(NA), NA)
})

test_that("Rounding works", {
  expect_equal(int_spacer(23.4), "23")
  expect_equal(int_spacer(567.8), "568")
})

test_that("Rounding to nearest even integer works", {
  expect_equal(int_spacer(23.5), "24")
  expect_equal(int_spacer(24.5), "24")
  expect_equal(int_spacer(25.5), "26")
})

test_that("Spacing works", {
  expect_equal(int_spacer(567), "567")
  expect_equal(int_spacer(1567), "1567")
  expect_equal(int_spacer(12567), "12 567")
  expect_equal(int_spacer(1234567), "1 234 567")
})

test_that("Vectorization works", {
  expect_equal(int_spacer(c(NA, 567.8, 25.5, 1567, 1234567, 1.2345e9)),
               c(NA, 568, "26", "1567", "1 234 567", "1 234 500 000")
               )

})
