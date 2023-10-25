class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
    render :update
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def create
    @subscription = Subscription.new subscription_params
    if @subscription.save
      redirect_to @subscription
    else
      render :new
    end
  end

  def update
    @subscription = Subscription.find(params[:id])
    p params

    if @subscription.update subscription_params
      redirect_to @subscription
    else
      render
    end

  end

  def edit
    @subscription = Subscription.find(params[:id])
  end

  def destroy
  end

  private
  def subscription_params
    params.require(:subscription).permit(:name, :url)
  end

end
