require_relative 'orange_tree'

describe TheHackingProject::S3RubyIntermediaire::J3Poo::OrangeTree do
  tree = TheHackingProject::S3RubyIntermediaire::J3Poo:: OrangeTree.new(10)
  tree2 = TheHackingProject::S3RubyIntermediaire::J3Poo:: OrangeTree.new(10)

  it "initialization" do
    expect(tree.height).to eq(10)
    expect(tree.years_old).to eq(0)
  end

  it "one year passes" do
    tree.one_year_passes
    expect(tree.years_old).to eq(1)
  end

  it "die of tree" do
    50.times{ tree.one_year_passes }
    expect(tree.height).to eq(0)
  end

  it "die of tree" do
    5.times{ tree2.one_year_passes }
    expect(tree2.oranges).to eq(20)
  end

  it "pick an orange" do
    tree2.pick
    expect(tree2.oranges).to eq(19)
  end

  it "pick 39 orange" do
    39.times{ tree2.pick }
    expect(tree2.oranges).to eq(0)
  end



###########################################    BONUS   ###################################
  tree3 = TheHackingProject::S3RubyIntermediaire::J3Poo:: OrangeTree.new(10)
  tree4 = TheHackingProject::S3RubyIntermediaire::J3Poo:: OrangeTree.new(10)
  tree5 = TheHackingProject::S3RubyIntermediaire::J3Poo:: OrangeTree.new(10)

  30.times{ tree4.one_year_passes }
  15.times{ tree5.one_year_passes }
  25.times{ tree4.pick }
  it "add one yea for every trees" do
    nbr = TheHackingProject::S3RubyIntermediaire::J3Poo::OrangeTree.ages_one_year_every_trees
    expect(tree3.years_old).to eq(1)
  end

  it "count whole oranges of all trees" do
    nbr = TheHackingProject::S3RubyIntermediaire::J3Poo::OrangeTree.all_oranges
    expect(nbr).to eq(0)
  end

  it "average height of trees" do
    nbr = TheHackingProject::S3RubyIntermediaire::J3Poo::OrangeTree.average_heaight
    expect(nbr).to eq(0)
  end

  it "average number of oranges" do
    nbr = TheHackingProject::S3RubyIntermediaire::J3Poo::OrangeTree.average_oranges
    expect(nbr).to eq(0)
  end
end
###########################################    BONUS   ###################################
