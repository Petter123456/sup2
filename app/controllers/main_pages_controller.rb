class MainPagesController < ApplicationController
  before_action :check_for_current_user, only: [:confirm_order_and_email]

  def index
  end

  def page_1
    # Product Areas
    @product_areas = ["IT", "Finance", "Marketing", "Call Center", "Technology",]
    # Position Percentages
    @position_percentage = ["10%",'20 %','30 %','40 %', '50 %', '60 %', '70 %', '80 %', '90 %', '100 %']
    # Experiance
    @level_of_experiance = ["Student","Just Graduated", "1 year", "2 Years", "3 years", "4 years", "5 years", "5 + years" ]
    # Min Month Salary
    @monthly_salary = []
    i = 20000
    while i < 150000 do
      @monthly_salary << i
      i += 2000
    end
    #Instance variables to query database
    @supplier = Supplier.all
    @supplier_first = @supplier.first
    #Supplier city inpput match database
    if params[:city].present?
      @suppliers = Supplier.where('city like ?',"%#{params[:city]}%")
    end
    #Product area gets different prices
    @assitance = params[:assitance].downcase rescue nil

    @salary_divided_by_hours = params[:salary].to_f / 162.5
    @salary_multiplied_by_months = params[:salary].to_f * 12.floor

  end

  def confirm_order_and_email



    contract = Contract.new(main_params)
    # creating contracts generated through strong params which is populated from tasks.js deepending on user selection
    if contract.save then
      # Email functions with corresponding user, supplier and admin - same email is sendt to all.
      @admin = "petter.fagerlund@gmail.com"
      @user = User.find(session[:user_id])
      @supplier = Supplier.find(params[:contracts][:supplier_id])
      @contract = Contract.last
      #Sends confirmation email to admin, supplier and user
      ConfirmationMailer.confirmation_email(@user).deliver_now
      ConfirmationMailer.admin_order_confirmation(@admin, @supplier, @user, @contract).deliver_now
      ConfirmationMailer.confirmation_email_supplier(@supplier, @user, @contract).deliver_now

      render page1_path
    end
  end

  def create
  end

  private

    def main_params
      params.require(:contracts).permit(
        :city,
        :name,
        :email,
        :position,
        :date,
        :productarea,
        :start_date,
        :end_date,
        :percentage,
        :experience,
        :salary,
        :supplier_id,
        :supplier_price,
        :supplier_name,
        :type_of_service
      )
    end

    def check_for_current_user
      unless current_user.present?
        flash[:error] = "Please logg in or sign up to place an order"
        redirect_to '/login'
      end
    end
end
