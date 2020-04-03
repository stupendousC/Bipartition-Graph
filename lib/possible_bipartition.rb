
def possible_bipartition(dislikes)
  
  visited = {}
  # visited will have key of index# for each dog, and value of T/F for easy flipping back and forth
  
  dislikes.each do |i|
    if dislikes[i] == []
      # friendly dog, can go anywhere
      if !visited[i]
        visited[i] = true
      end
        
    elsif visited[i].nil?
      queue = [i]
      visited[i] = true

      until queue.empty?
        currDog = queue.pop()

        dislikes[currDog].each do |enemy|
          queue << enemy
          visited[enemy] = !visited[i]
        end

      end
    end
    
  end

end
