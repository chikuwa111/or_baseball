module Baseball

  TEAM_ARRAY = [
    "巨人", "阪神", "広島", "中日", "DeNA", "ヤクルト",
    "ソフトバンク", "日本ハム", "オリックス", "西武", "楽天", "ロッテ"
  ].sort

  DATA = {
  # チーム: [定めた強さパラメータ, 観客動員数, 本塁打, 防御率, ５年間の年俸合計]
    "巨人" => [16.94, 208029, 8.11, 29.9, 216.2],
    "阪神" => [14.05, 194706, 4.94, 35.74, 164.3],
    "ソフトバンク" => [17.36, 172068, 8.25, 30.78, 196.0],
    "広島" => [15.07, 129963, 8.39, 18.01, 115.8],
    "日本ハム" => [16.41, 134446, 7.65, 32.31, 124.9],
    "中日" => [14.02, 141899, 5.82, 33.03, 139.1],
    "DeNA" => [12.14, 110205, 7.42, 38.57, 104.0],
    "ヤクルト" => [12.90, 106337, 8.08, 39.34, 128.9],
    "オリックス" => [13.71, 111937, 6.72, 31.21, 143.8],
    "西武" => [14.93, 109487, 7.73, 34.81, 124.2],
    "楽天" => [14.73, 98273, 6.14, 33.303, 120.1],
    "ロッテ" => [15.76, 91543, 6.43, 36.775, 120.1]
  }

  STRENGTH = 0
  POPULAR = 1
  HOMERUN = 2
  DEFENCE = 3
  MONEY = 4

  def get_strength_gap(pair)
    # リーグごとに強さの小さい順にソートして、順位の対応するチーム間の強さの差の絶対値を合計する
    league1 = pair[0].sort_by {|team| DATA[team][STRENGTH]}
    league2 = pair[1].sort_by {|team| DATA[team][STRENGTH]}

    strength_gap = 0
    6.times do |i|
      strength_gap += (DATA[league1[i]][STRENGTH] - DATA[league2[i]][STRENGTH]).abs
    end
    return strength_gap
  end

  def get_popular_gap(pair)
    league1 = pair[0]
    league2 = pair[1]
    popular_gap = 0
    6.times do |i|
      popular_gap += DATA[league1[i]][POPULAR] - DATA[league2[i]][POPULAR]
    end
    return popular_gap
  end

  def get_homerun_gap(pair)
    league1 = pair[0]
    league2 = pair[1]
    homerun_gap = 0
    6.times do |i|
      homerun_gap += DATA[league1[i]][HOMERUN] - DATA[league2[i]][HOMERUN]
    end
    return homerun_gap
  end

  def get_defence_gap(pair)
    league1 = pair[0]
    league2 = pair[1]
    defence_gap = 0
    6.times do |i|
      defence_gap += DATA[league1[i]][DEFENCE] - DATA[league2[i]][DEFENCE]
    end
    return defence_gap
  end

  def get_money_gap(pair)
    league1 = pair[0]
    league2 = pair[1]
    money_gap = 0
    6.times do |i|
      money_gap += DATA[league1[i]][MONEY] - DATA[league2[i]][MONEY]
    end
    return money_gap
  end

  def get_fix(sum)
    fix = Array.new(sum.length)
    sum.each_with_index do |s, i|
      fix[i] = 100 / (s / (462.0 * 2))
    end
    return fix
  end

  def sort_result(result, fix, index)
    sort_result = result.sort_by do |r|
      sort_value = 0
      index.each {|i| sort_value += (r[1][i.to_i] * fix[i.to_i]).abs}
      sort_value
    end
    return sort_result
  end

  def get_data(index)
    result = {}
    sum = [0, 0, 0, 0, 0]
    TEAM_ARRAY.combination(6) do |league|
      pair = [league, TEAM_ARRAY - league].sort

      strength_gap = get_strength_gap(pair)
      sum[STRENGTH] += strength_gap.abs
      popular_gap = get_popular_gap(pair)
      sum[POPULAR] += popular_gap.abs
      homerun_gap = get_homerun_gap(pair)
      sum[HOMERUN] += homerun_gap.abs
      defence_gap = get_defence_gap(pair)
      sum[DEFENCE] += defence_gap.abs
      money_gap = get_money_gap(pair)
      sum[MONEY] += money_gap.abs

      result[pair] = [strength_gap, popular_gap, homerun_gap, defence_gap, money_gap]
    end
    fix = get_fix(sum)
    sort_result = sort_result(result, fix, index)
    return [fix, sort_result]
  end

end
