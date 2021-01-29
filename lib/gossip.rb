require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("db/gossip.csv", "a+") do |csv|
      csv << [@author, @content]
      end
  end

  def self.all
    all_gossip = []
    file = CSV.read("db/gossip.csv")
    file.each do |ligne|
    gossip_provisoire = Gossip.new(ligne[0], ligne[1])
    all_gossip << gossip_provisoire
    end
    return all_gossip
  end 

  def self.save_after_destroy(param)
    CSV.open("db/gossip.csv", "w") do |csv|
      param.each do |ligne|
        csv << [ligne.author, ligne.content]
      end
    end
  end




end
