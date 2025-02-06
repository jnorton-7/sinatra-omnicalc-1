require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do

  erb(:bye)

end



get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end


get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 0.5

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @display_apr = params.fetch("users_apr")
  @display_years = params.fetch("users_years")
  @display_principal = params.fetch("users_principal")
  
  
  @the_apr = params.fetch("users_apr").to_f / 1200
  @the_num_years = params.fetch("users_years").to_i * 12
  @the_principal = params.fetch("users_principal").to_f
  
  @the_numerator = @the_apr * @the_principal
  @the_denominator = 1 - (1+@the_apr) ** (-@the_num_years)
  
  @the_monthly_payment = @the_numerator / @the_denominator

  erb(:payment_results)
end
