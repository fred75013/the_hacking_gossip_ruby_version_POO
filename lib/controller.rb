require 'gossip'
require 'view'
require 'csv'

class Controller
  attr_accessor :view

  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params[:author], params[:content])
    gossip.save
  end

  def index_gossips
    @view.index_gossips(Gossip.all)
  end

  def destroy
    all_gossips = Gossip.all
    param = @view.destroy(all_gossips)
    Gossip.save_after_destroy(param)
  end


end
