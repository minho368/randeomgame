class LottoController < ApplicationController
  def clickview
  end
    
  def shownum 
    require('open-uri')
    require('json')
    
    @random_lotto = (1..45).to_a.sample(6).sort
    
    

    @get_info = JSON.parse open("http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=").read
    
    
    
    @drw_numbers=[]
    @get_info.each do |k,v|
      @drw_numbers << v if k.include? 'drwtNo'
    end
    
    @bonus_number = @get_info["bnusNo"]
    
    $array = Array.new(45)
    $array = (1..45).to_a
    @my_numbers =$array.sample(7).sort
    @match_numbers = @drw_numbers	& @my_numbers
    
    @match_cnt = @match_numbers.count
    
    if @match_cnt == 6 
        @result='1등'
        
    elsif @match_cnt == 5 && @my_numbers.include?(@bonus_number)
        @result='2등'
    
    elsif @match_cnt == 5 
        @result='3등'
    
    elsif @match_cnt == 4
        @result='4등'
    
    elsif @match_cnt == 3
        @result='5등'
    
    else
        @result='꽝'
    end
    
      
        require('open-uri')
        require('json')
        
    
    
      end
    end
