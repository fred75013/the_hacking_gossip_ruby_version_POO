class View
  attr_accessor :author, :content

  def create_gossip
      puts "Quel est ton nom?"
      print "> "
      @author = gets.chomp
      puts "Quel est ton gossip crousti aujourd'hui ?"
      @content = gets.chomp
      return {content: @content, author: @author}
  end

  def index_gossips(gossips)
    gossips.each do |gossip|
      puts "#{gossip.author} #{gossip.content}"
    end 
  end

  def destroy(all_gossip)
    puts "Choisi le potin que tu veux supprimer :"
    i = 0
    all_gossip.map do |ligne|  
      puts "#{i += 1} - #{ligne.author} #{ligne.content}"
    end
    param = gets.chomp.to_i
    
    all_gossip.delete_at(param - 1)
    return all_gossip
  end

end