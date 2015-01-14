module ApplicationHelper
  def alert_message?
    ( !flash[:success].blank? or !flash[:danger].blank? )
  end
  def alert_type
    return 'alert-success' unless flash[:success].blank?
    return 'alert-danger'  unless flash[:danger].blank?
  end
  def alert_content
    if !flash[:success].blank?
      flash[:success]
    elsif !flash[:danger].blank?
      flash[:danger]
    else
      ''
    end
  end
end

