
df <- tibble::tibble(
  a = rnorm(10, 5, 1),
  b = rnorm(10, 5, 1),
  c = rnorm(10, 5, 1),
  d = rnorm(10, 5, 1)
)

range(df$a)

#quiero llevar los valores entre 0, 1
df1 <- df

df1$a <- (df$a - min(df$a, na.rm = TRUE)) /
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df1$b <- (df$b - min(df$b, na.rm = TRUE)) /
  (max(df$b, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df1$c <- (df$c - min(df$c, na.rm = TRUE)) /
  (max(df$c, na.rm = TRUE) - min(df$c, na.rm = TRUE))
df1$d <- (df$d - min(df$d, na.rm = TRUE)) /
  (max(df$d, na.rm = TRUE) - min(df$d, na.rm = TRUE))

rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

for (i in seq_along(df)) {
df[[i]] <- rescale01(df[[i]])
} 
