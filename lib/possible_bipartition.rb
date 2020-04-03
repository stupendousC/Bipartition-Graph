# BFS
def possible_bipartition(dislikes)
  
  # when can we stop? when we visited all the dogs
  # what about friendly dogs? they're exempt
  friendlies = dislikes.select { |enemyList| enemyList == [] }
  needToVisitThisMany = dislikes.length - friendlies.length
  
  dislikes.length.times do |i|
    # starting a new scenario with i as the starterNode
    queue = [i]
    visited = {}
    # visited.key = index# for each dog, visited.value = T/F for easy flipping back and forth
    
    visited[i] = true
    
    until queue.empty?
      currDog = queue.pop()
      newColor = !visited[currDog]
      
      dislikes[currDog].each do |enemy|
        if visited[enemy].nil?
          visited[enemy] = newColor 
          queue << enemy
        elsif visited[enemy] != newColor
          return false
        end
      end
      
      newColor = !newColor if queue.empty?
    end
    
    # no need to start a new scenario if we visited everybody
    return true if visited.keys.count == needToVisitThisMany
  end
  
  return true
end


################### BELOW IS JUST THE VERBOSE VERSION W/ PRINT STATEMENTS SO I CAN UNDERSTAND LATER #################
def possible_bipartition_VERBOSE(dislikes)
  puts "\nADJ LIST = #{dislikes}"
  # when can we stop? when we visited all the dogs
  # what about friendly dogs? they're exempt
  
  friendlies = dislikes.select do |enemyList|
    enemyList == []
  end
  
  needToVisitThisMany = dislikes.length - friendlies.length
  puts "NEED TO VISIT THIS MANY: #{needToVisitThisMany}"
  
  dislikes.length.times do |i|
    puts "\nNEW STARTER NODE = #{i}"
    # start a new scenario with i as the starterNode
    queue = [i]
    visited = {}
    # visited will have key of index# for each dog, and value of T/F for easy flipping back and forth
    
    visited[i] = true
    
    until queue.empty?
      currDog = queue.pop()
      newColor = !visited[currDog]
      puts "looking at currDog = #{currDog}"
      
      dislikes[currDog].each do |enemy|
        puts "\tenemy = #{enemy}"
        if visited[enemy].nil?
          visited[enemy] = newColor 
          queue << enemy
        elsif visited[enemy] != newColor
          return false
        end
      end
      
      newColor = !newColor if queue.empty?
    end
    
    puts "visited = #{visited}, ARE WE DONE? #{visited.keys.count} == #{needToVisitThisMany}"
    return true if visited.keys.count == needToVisitThisMany
  end
  
  return true
end


