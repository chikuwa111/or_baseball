class MainController < ApplicationController
  include Baseball

  def top
  end

  def result
    @scores = params[:scores]
    @sort = params[:sort]
    if !@scores
      redirect_to root_path, alert: "指標を１つ以上選択してください"
      return false
    end
    @result = get_result(@scores)
    if (@sort == "best")
      @result = @result[0..4]
    else
      @result = @result[-5..-1]
    end
  end

end
