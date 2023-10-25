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
    p_ = params.require(:subscription).permit(:name, :url, tags: [])
    p_[:tags] =  p p_[:tags].delete_if(&:empty?).map(&:to_i).map {|id| Tag.find id}
    p_
  end

end