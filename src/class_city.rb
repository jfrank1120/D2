# city datatype definition
class City
  def initialize(rand, name, gold, silver)
    @random = rand
    @name = name
    @gold = gold
    @silver = silver
    @links = []
  end

  def next_city?
    @links[(@random.rand * @links.count - 1).floor]
  end

  def add_link(link)
    @links << link
  end

  def links?
    @links
  end

  def name?
    @name
  end

  def gold?
    @gold
  end

  def silver?
    @silver
  end

  def mine_gold
    @random.rand * @gold
  end

  def mine_silver
    @random.rand * @silver
  end
end