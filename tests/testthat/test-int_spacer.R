test_that("Returning NA works", {
  expect_equal(int_spacer(NA), NA)
  expect_equal(int_spacer("blah"), NA)
  expect_equal(int_spacer("blah 123"), NA)
})

test_that("Converting a purely numeric string to a number works", {
  expect_equal(int_spacer("123"), "123")
  expect_equal(int_spacer("456.789"), "457")
})


test_that("rounding works", {
  expect_equal(int_spacer(23.4), "23")
  expect_equal(int_spacer(567.8), "568")
})

test_that("rounding to nearest even integer works", {
  expect_equal(int_spacer(23.5), "24")
  expect_equal(int_spacer(24.5), "24")
  expect_equal(int_spacer(25.5), "26")
})

test_that("spacing works", {
  expect_equal(int_spacer(567), "567")
  expect_equal(int_spacer(1567), "1567")
  expect_equal(int_spacer(12567), "12 567")
  expect_equal(int_spacer(1234567), "1 234 567")
  expect_equal(int_spacer("123456789"), "123 456 789")
})
