class SpentTimeCurveController < ApplicationController
  unloadable

  def update
    @user = User.current
    @user.pref[:spent_time_period] = params[:period]
    @user.pref.save
    
    respond_to do |format|
      format.html { 
        render :partial => "my/blocks/spent_time_curve_part", :locals => {:user => @user}
      }
    end
  end
end