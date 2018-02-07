class MainPagesController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

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
end

  def confirm_order_and_email
    # creating contracts generated through strong params which is populated from tasks.js deepending on user selection
    Contract.create(main_params)
    byebug

    @contract = Contract.last
    # Email functions with corresponding user, supplier and admin - same email is sendt to all.
    @user = User.find(session[:user_id])
    @supplier = Supplier.find(params[:contracts][:supplier_id])
    @admin = "petter.fagerlund@gmail.com"
    ConfirmationMailer.confirmation_email(@user).deliver_now
    ConfirmationMailer.admin_order_confirmation(@admin).deliver_now
    ConfirmationMailer.confirmation_email_supplier(@supplier).deliver_now

  end

  def create
  end

  def new
  end

  def show
  end

  def delete
  end

  private

    def main_params
      params.require(:contracts).permit(:city, :name, :email, :position, :date, :productarea, :start_date, :end_date, :percentage, :experiance, :salary, :supplier_id, :supplier_price, :suppliers_name)
    end

end
