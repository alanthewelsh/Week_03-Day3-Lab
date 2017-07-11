require 'pg' 

class Bounty

  attr_reader :id
  attr_accessor :name, :species, :bounty_value, :last_known_location

  def initialize(characteristics)
    @name = characteristics['name']
    @species = characteristics['species']
    @bounty_value = characteristics['bounty_value'].to_i
    @last_known_location = characteristics['last_known_location']
    @id = characteristics['id'].to_i if characteristics['id']
  end

  def save
    db = PG.connect( { dbname: 'bounties', host: 'localhost' } )
    sql = 
      "INSERT INTO bounty
      (name, species, bounty_value, last_known_location)
      VALUES
      ('#{@name}', '#{@species}', #{@bounty_value}, '#{@last_known_loation}')
      RETURNING id;"
    @id = db.exec(sql)[0]["id"].to_i
    db.close
  end

  def update
    db = PG.connect( { dbname: 'bounties', host: 'localhost' } )
    sql = "UPDATE bounty
          SET (name, species, bounty_value, last_known_location) = 
          ('Han Solo', 'Human', 2000, 'Portobello')
          WHERE id = #{@id}"
    db.exec(sql)
    db.close
  end

  def self.delete_all
    db = PG.connect( { dbname: 'bounties', host: 'localhost' } )
    sql = "DELETE FROM bounty"
    db.exec(sql)
    db.close
  end

  def delete
    db = PG.connect( { dbname: 'bounties', host: 'localhost' } )
    sql = "DELETE FROM bounty where id = #{@id}"
    db.exec(sql)
    db.close
  end

  # def find

  # end

  def self.delete_all
     db = PG.connect( { dbname: 'bounties', host: 'localhost' } )
    sql = "DELETE FROM bounty"
    db.exec(sql)
    db.close
  end

  def self.find
    db = PG.connect( { dbname: 'bounties', host: 'localhost' } )
    sql = "SELECT * FROM bounty;"
    space_cowboys = db.exec(sql)
    db.close
    return space_cowboys.find { |i| Bounty.new(i) }
  end

  def self.all
    db = PG.connect( { dbname: 'bounties', host: 'localhost' } )
    sql = "SELECT * FROM bounty;"
    space_cowboys = db.exec(sql)
    db.close
    return space_cowboys.map { |i| Bounty.new(i) }
  end

end