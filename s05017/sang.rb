@spot = [
  [90,38],[72,21],[81,70],[50,90],[44,64],[35,31],[67,46],[67,80] #0번 빌딩이랑 9번 빌딩은 고정이니까, 즉, 0번 빌딩에서 출발, 9번빌딩에서 도착이니까, 이 두 빌딩은spot에서 뺐어~
]

#generation
#######(first element number)
@pool = [] #수업시간에는 용어까지 말 하진 않았지만, 염색체를 이루는 가장 기본단위를 Gene 이라고 부르고, Gene이 묶인걸 Chromosome이라고 부르고, 이 Chromosome이 묶인걸 Population 이라고 불러. 얘는 Population이 되는거겠지?

def initializing
  0.upto(7) do |x|####### 상화코드에는 0.upto(2)라고 되어있던데, Population(솔루션 집단. 즉, 인구)는 많으면 많을수록 좋아. 보통 100개 정도 하고, 경우에 따라선 1,000개 또는 10,000개로 하기도 해. 수업시간에 본 Youtube영상에서는 64개였나. 근데 100개 하면 너무 금방 한방에 답이 나오길래, 내가 이걸 0.upto(7)으로 바꿨어.
    @pool << @spot.shuffle #shuffle에서 0번 빌딩이랑 9번 빌딩 뺐으니 shuffle 해도 문제 없어. @spot에서 0번과 9번 안뺐으면 문제있었을듯-ㅎㅎ
  end
end

def length some_chromosome #유전자 하나를 Argument로 받을게.
  l = 0 #초기화 굿굿!
  0.upto(6) do |x|
    ll = ((some_chromosome[x][0] - some_chromosome[x+1][0])**2 + 
          (some_chromosome[x][1] - some_chromosome[x+1][1])**2)
    l = l + Math.sqrt(ll) # Root 계산할때는 Math.sqrt(값) 이렇게 계산해.
  end
  #0번 빌딩이랑 첫번째 Gene과의 거리, 그리고 9번 빌딩이랑 마지막 Gene과의 거리를 계산해서 더해주자.
  l = l + 
        Math.sqrt((33 - some_chromosome[0][0])**2 +
        (3 - some_chromosome[0][1])**2) + 
        Math.sqrt((78 - some_chromosome[7][0])**2 +
        (28 - some_chromosome[7][1])**2)
  return l
end

def length_sort
  #상화가 여기에 Hash를 써서 sorting 하려고 했는데, 기본적으로 Hash는 속성이 "순서가 없다."라는게 있어. 
  #즉, Hash는 "horse" => "말", "duck" => "오리"와 같이 사전적인 데이터를 저장하는데 주로 쓰여.
  #여기서 "Horse"와 "duck" 사이에는 누가 먼저 앞에 있다는 개념 자체가 없다고 여겨도 돼.
  #약간 변형을 줘서 "Horse"가 "duck" 앞에 나오는것처럼 출력은 할 수 있는데, Major 기능은 아니야. (주로 사전순 출력등을 할때만 이 방법이 쓰여.)
  #"순서"를 의미가 있게 저장 하기 위해선, Array를 쓰는게 나아.

  #그런데 여기에선 Array를 통해서 length를 저장하기가 좀 빡쎄니까. @pool을 좀 수정하자.  
  #일단 @pool 맨 뒤에 length값을 계산해서 저장해보자.
  #그러면[[90,38],[72,21],[81,70],[50,90],[44,64],[35,31],[67,46],[67,80], 342] 같은 형태가 되겠지? 마지막 342를 가지고 소팅을 할거야.

  @pool.each do |x|
    x << length(x)
  end

  @pool.sort!{|x, y| x[-1] <=> y[-1]} #이 소팅 방법 좀 신기할텐데, 익혀두면 많이 편해. 특정 기준값을 가지고 배열을 재배치 하는거야. 여기선 x[-1]값, 즉 맨 뒤에 있는 값을 가지고 배열을 재배치해.

  #그리고 이제 이 length값이 필요가 없어졌으니 다 지우자.
  @pool.each do |x|
    x.delete_at(-1)
  end
end

def choosing #무슨 역할의 함수인지 몰라서ㅠㅠ
end


def mating
  cutting_point = @pool.size / 3 #대충 한 상위 1/3 정도를 가지고 결혼을 시켜보자. 나머지 2/3는 빠빠이.

  cutting_point.upto(@pool.size - 1) do |x|
    mother = rand(cutting_point) #엄마 고르고
    father = rand(cutting_point) #아빠 골라서

    @pool[x] = @pool[mother][0...4] + @pool[father][4...8] #둘 합체!
  end
end

def fix #교배 후, 고장난 유전자 수정합시다!
  0.upto(@pool.size - 1) do |x|
    if @pool[x].uniq.size < 8 #만일 uniq값이 8보다 작다면, 뭔가 겹치는게 있다는것임.
      @pool[x].uniq!          #!느낌표 함수를 통해서 @pool 자체를 uniq 하게 바꾸고,
      new_array = @spot.shuffle - @pool[x] #새로 만든 배열에서 기존꺼 뺀 다음.
      @pool[x] = @pool[x] + new_array #이걸 기존에 추가하자. 수업시간에 상화가 말 한대로 원래 위치가 변하기 때문에 안좋은 코드긴 한데, 일단 짜기 편하니까-ㅎㅎ
    end
  end
end

#mutation
def mutation #돌연변이 만드는건 쉬워.
  0.upto(@pool.size - 1) do |x|
    point1 = rand(8) #두 숫자 뽑아
    point2 = rand(8)

    temp = @pool[x][point1] #그 둘을 Swap!
    @pool[x][point1] = @pool[x][point2]
    @pool[x][point2] = temp
  end
end

#next generation fixation
def next_g_fix #얘도 뭔지 몰라서ㅠ
  @next_generation += @lengths
end

initializing
best_chromosome = @pool[0][0..-1] #제일 좋은 유전자는 기록해두자.

loop do 
  length_sort
  
  if length(best_chromosome) > length(@pool[0]) #새로 생긴게 기존의 Best보다 좋다면,
    best_chromosome = @pool[0][0..-1]           #기존꺼를 새걸로 교체!
  end
  puts "#{best_chromosome.inspect}, #{length(best_chromosome)}"

  mating
  fix
  mutation
end

