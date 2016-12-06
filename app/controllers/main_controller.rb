class MainController < ApplicationController

  def top
  end

  def result
    # binding.pry
    @scores = params[:scores]
    @sort = params[:sort]
    if !@scores
      redirect_to root_path, alert: "指標を１つ以上選択してください"
    end
  end

end
