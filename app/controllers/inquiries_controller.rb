class InquiriesController < ApplicationController
  # お問い合わせ画面
  def index
    @inquiry = Inquiry.new
    render 'index'
  end

  # お問い合わせ確認画面
  def confirm
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    if @inquiry.valid?
      render 'confirm'
    else
      render 'index'
    end
  end

  # お問い合わせ完了通知画面
  def thanks
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    InquiryMailer.received_email(@inquiry).deliver
    render 'thanks'
  end
end
