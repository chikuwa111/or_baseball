class MainController < ApplicationController
  include Baseball

  def top
  end

  def result
    @scores = params[:scores]
    @index = ['STRENGTH', 'POPULAR', 'HOMERUN', 'DEFENCE', 'MONEY']
    @sort = params[:sort]
    if !@scores
      redirect_to root_path, alert: "指標を１つ以上選択してください"
      return false
    end
    data = get_data(@scores)
    @fix = data[0]
    @result = data[1]
    if (@sort == "best")
      @result = @result[0..4]
    else
      @result = @result[-5..-1]
    end
  end

end
