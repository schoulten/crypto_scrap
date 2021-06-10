crypt_scrap <- function() {

  # Crytocurrency page URL
  crypto_url <- rvest::read_html(
    "https://www.tradingview.com/markets/cryptocurrencies/prices-all/"
  )

  # Get raw data from URL
  crypto_raw <- rvest::html_nodes(crypto_url, css = "table")

  # Convert from list to tibble
  crypto_table <- rvest::html_table(crypto_raw)
  crypto_table <- purrr::pluck(crypto_table, 1)
  crypto_table <- purrr::set_names(
    crypto_table,
    c(
      "Name",
      "Mkt Cap",
      "FD Mkt Cap",
      "Last",
      "Avail. Coins",
      "Total Coins",
      "Traded Vol",
      "Chg %"
    )
  )

  # Return tibble
  return(crypto_table)

}
