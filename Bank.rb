class Bank
    attr_accessor :accounts, :customers
  
    def initialize
      @accounts = {}
      @customers = {}
    end
  
    def create_account(account_number, initial_balance, customer_name)
      if @accounts.key?(account_number)
        puts "Account with account number #{account_number} already exists."
      else
        account = BankAccount.new(account_number, initial_balance)
        @accounts[account_number] = account
        customer = Customer.new(customer_name, account_number)
        @customers[account_number] = customer
        puts "Account created successfully for #{customer_name}. Account number: #{account_number}"
      end
    end
  
    def deposit(account_number, amount)
      if @accounts.key?(account_number)
        account = @accounts[account_number]
        account.deposit(amount)
      else
        puts "Account with account number #{account_number} does not exist."
      end
    end
  
    def withdraw(account_number, amount)
      if @accounts.key?(account_number)
        account = @accounts[account_number]
        account.withdraw(amount)
      else
        puts "Account with account number #{account_number} does not exist."
      end
    end
  
    def view_balance(account_number)
      if @accounts.key?(account_number)
        account = @accounts[account_number]
        account.display_balance
      else
        puts "Account with account number #{account_number} does not exist."
      end
    end
  end
  
  class BankAccount
    attr_reader :account_number, :balance
  
    def initialize(account_number, initial_balance = 0)
      @account_number = account_number
      @balance = initial_balance
    end
  
    def deposit(amount)
      if amount > 0
        @balance += amount
        puts "Deposited $#{amount}. New balance: $#{@balance}"
      else
        puts "Invalid deposit amount. Amount must be greater than 0."
      end
    end
  
    def withdraw(amount)
      if amount > 0 && amount <= @balance
        @balance -= amount
        puts "Withdrawn $#{amount}. New balance: $#{@balance}"
      elsif amount <= 0
        puts "Invalid withdrawal amount. Amount must be greater than 0."
      else
        puts "Insufficient funds. Current balance: $#{@balance}"
      end
    end
  
    def display_balance
      puts "Account #{@account_number}: Balance is $#{@balance}"
    end
  end
  
  class Customer
    attr_reader :name, :account_number
  
    def initialize(name, account_number)
      @name = name
      @account_number = account_number
    end
  end

bank = Bank.new

  loop do
    puts "\nSelect any one operation :"
    puts "1. Create Account"
    puts "2. Deposit"
    puts "3. Withdraw"
    puts "4. View Balance"
    puts "5. Exit"
    print "Enter your choice: "
    choice = gets.chomp.to_i
  
    case choice
    when 1
        puts "For new account, you've to enter -"
        print "Any numeric digits for your account number: "
        account_number = gets.chomp
        if account_number == ''
            puts "You've not entered account number for your account."
            puts "Restart the process."
            next
        end    
        print "Initial balance for your account: "
        initial_balance = gets.to_i
        if initial_balance == ''
            puts "You've not entered amount for your account."
            puts "Restart the process."
            next
        end
        print "Account holders name: "
        customer_name = gets.chomp
        if customer_name == ''
            puts "You've not entered account holders name."
            puts "Restart the process."
            next
        end
        bank.create_account(account_number, initial_balance, customer_name)
    when 2
        puts "To deposit money into your account, you've to enter -"
        print "Your account number: "
        account_number = gets.chomp
        print "Enter deposit amount: "
        amount = gets.chomp.to_f
        bank.deposit(account_number, amount)
    when 3
        puts "To withdraw money from your account, you've to enter -"
        print "Your account number: "
        account_number = gets.chomp
        print "How much amount you want to withdraw: "
        amount = gets.chomp.to_f
        bank.withdraw(account_number, amount)
    when 4
        puts "To view balance in your account, you've to enter -"
        print "Your account number: "
        account_number = gets.chomp
        bank.view_balance(account_number)
    when 5
      puts "Exiting the program"
      break
    else
      puts "Invalid choice. Please select a valid option."
    end
  end