 
require_relative '../lib/cryptos'

describe "retrieves the price of all crypto-currencies and stores them neatly in an array of hashes. " do
  it " Isolating HTML elements" do
    expect(crypto_sccrapper(url)).to eq(true)
    expect(is_multiple_of_3_or_5?(5)).to eq(true)
 
  end

  it "should return FALSE when an integer is NOT a multiple of 3 or 5" do
    # je te laisse écrire ces tests-là
  end
end