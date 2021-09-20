# frozen_string_literal:true

def prompt(message)
  puts "=*=*=> #{message}"
end

def valid_number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

def valid_yn?(ans)
  to = %w[y n]
  to.include?(ans)
end

def dollars(num)
  format("%.2f",num)
end

def apr_perc(num)
  format("%.4f",num)
end

welcome_prompt = <<~MSG
  Welcome! Lets see how that monthly payment is going to look..
  *  
  *
MSG

calculating_prompt = <<~MSG
  That's all we need..
  Let's get to calculating your Monthly Payment!
MSG

prompt welcome_prompt

loop do
  sales_price = ''
  loop do
    prompt 'What is the total sales price?'
    sales_price = gets.chomp
    if sales_price.to_f.negative?
      prompt 'Only positive sales values please!'
      next
    elsif sales_price.start_with? '.'
      sales_price = "0#{sales_price}"
    end
    break if valid_number? sales_price

    prompt 'Enter sales price as a numerical value.'
  end

  down_payment = ''
  loan_total = ''
  ans = ''
  loop do
    loop do
      prompt "Are you putting any money down? (Type 'y' for yes and 'n' for no)"
      ans = gets.chomp
      ans = ans.downcase
      break if valid_yn?(ans)

      prompt 'Please enter y/n?'
    end
    if ans == 'y'
      loop do
        prompt 'How much?'
        down_payment = gets.chomp
        if valid_number?(down_payment)
          loan_total = sales_price.to_f - down_payment.to_f
          break
        elsif down_payment.start_with? '.'
          down_payment = "0#{down_payment}"
          loan_total = sales_price.to_f - down_payment.to_f
          break
        else
          prompt 'Please enter a valid number'
        end
      end
    else
      loan_total = sales_price.to_i - 0
      break
    end
    break
  end

  apr_years = ''
  apr_months = ''
  loop do
    prompt 'What is the Annual Percentage Rate(APR)?'
    apr_years = gets.chomp
    if apr_years.to_f.negative?
      prompt "Only positive APR's please!"
      next
    elsif apr_years.start_with? '.'
      apr_years = "0#{apr_years}"
      apr_months = apr_years.to_f / 1200
      break
    end
    if valid_number?(apr_years)
      apr_years = apr_years.to_f
      apr_months = apr_years / 1200
      break
    else
      prompt 'Please enter the APR as a numerical value.'
    end
  end

  loan_years = ''
  loan_months = ''
  loop do
    prompt 'What is the duration of the loan in years?'
    loan_years = gets.chomp
    if loan_years.to_f.negative?
      prompt 'Only positive number of years please!'
      next
    end
    if valid_number?(loan_years)
      loan_months = loan_years.to_f * 12
      break
    elsif loan_years.start_with? '.'
      loan_years = "0#{loan_years}"
      loan_months = loan_years.to_f * 12
      break
    else
      prompt 'Enter loan duration as a numerical value.'
    end
  end

  puts calculating_prompt
  puts "The total amount being borrowed is... $#{loan_total}"
  puts "The Annual Percentage Rate is #{apr_years}, and the Monthly Percentage Rate is #{apr_perc(apr_months)}"
  puts "The total loan term is #{loan_years} years, or #{loan_months} months"
  if loan_months.zero?
    monthly_payment = loan_total
  elsif apr_months != 0
    monthly_payment = loan_total * (apr_months / (1 - (1 + apr_months)**-loan_months))
  else
    monthly_payment = loan_total / loan_months
  end
  prompt "Your Monthly Payments will be: $#{dollars(monthly_payment)}"
  prompt 'Would you like to run some other numbers? y/n'
  again = ''
  loop do
    again = gets.chomp
    again = again.downcase
    break if valid_yn?(again)

    prompt 'y/n only please! Would you like to run more numbers?'
  end

  break if again == 'n'

  prompt 'Get your numbers ready!'
end
