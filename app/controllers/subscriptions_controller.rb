class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
    render :edit
  end

  def show
    @subscription = Subscription.find(params[:id])
    render :edit
  end

  def create
    @subscription = Subscription.new subscription_params
    if @subscription.save
      redirect_to @subscription
    else
      redirect_to root_path
    end
  end

  def update
    @subscription = Subscription.find(params[:id])

    @subscription.update subscription_params
    render :edit

  end

  def edit
    @subscription = Subscription.find(params[:id])
  end

  def destroy
    Subscription.find(params[:id]).destroy
    redirect_to root_path
  end

  private
  def subscription_params
    p_ = params.require(:subscription).permit(:name, :url, tags: [])
    p_[:tags] =  p p_[:tags].delete_if(&:empty?).map(&:to_i).map {|id| Tag.find id}
    p_
  end

end
