class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.premium?
      flash[:alert] = "You are already a Premium member! Want to downgrade? Go to \'Edit profile\'"
      redirect_to root_path
    end

    @stripe_btn_data = {
      key: "#{Rails.configuration.stripe[:publishable_key]}",
      description: "Wikeez Premium - #{current_user.email}",
      amount: 1500
    }
  end

  def create
    # Creates a Stripe Customer object, for associating with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note - this is not the User ID in the app
      amount: 1500,
      description: "Wikeez Premium - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thanks for becoming a Premium member, #{current_user.email}!"
    current_user.premium!
    redirect_to root_path

    # Stripe will send back CardErrors, with friendly messages when something goes wrong. This 'rescue block' catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def downgrade_to_basic
    # change user role to :basic and makes their private wikis public.
    current_user.basic!
    current_user.wikis.each do |wiki|
      wiki.update(private: false)
    end
    redirect_to edit_user_registration_path
  end
end
