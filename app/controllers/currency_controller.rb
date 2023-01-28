class CurrencyController < ActionController::Base
  def first_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols").keys
    render({ :template => "currency_template/step_one.html.erb" })
  end

  def second_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols").keys

    @from_symbol = params.fetch("from_currency")
    render({ :template => "currency_template/step_two.html.erb" })
  end

  def display_currency
    @from_symbol = params.fetch("from_currency")
    @to_symbol = params.fetch("to_currency")
    @address = "https://api.exchangerate.host/convert?from=" + @from_symbol + "&to=" + @to_symbol
    @raw_data = open(@address).read
    @parsed_data = JSON.parse(@raw_data)
    @result = @parsed_data.fetch("info").fetch("rate")

    render({ :template => "currency_template/step_three.html.erb" })
  end
end
