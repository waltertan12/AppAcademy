require_relative '../questions_database'
require 'byebug'

class ModelBase
  TABLE = nil

  def self.find_by_id(id)
    hash = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self::TABLE}
      WHERE
        id = ?
    SQL

    self.new(hash.first)
  end

  def self.all
    hashes = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self::TABLE}
      SQL

      hashes.map do |hash|
        self.new(hash)
      end
  end

  def save
    inst_vars = self.instance_variables.drop(1)
    table = self.class::TABLE

    hash_args = {}

    inst_vars.each do |var|
      hash_args[var.to_s[1..-1]] = self.instance_variable_get(var.to_s)
    end

    insert_str = hash_args.keys.join(", ")
    val_str = hash_args.keys.map {|key| ":" + key }.join(", ")

    if id
      set_str = hash_args.keys.map {|key| key + " = " + ":" + key }.join(", ")
      QuestionsDatabase.instance.execute(<<-SQL, hash_args)
        UPDATE
          #{table}
        SET
          #{set_str}
        WHERE
          id = #{id}
      SQL
    else
      db = QuestionsDatabase.instance.execute(<<-SQL, hash_args)
        INSERT INTO
          #{table}(#{insert_str})
        VALUES
          (#{val_str})
      SQL

      self.id = QuestionsDatabase.instance.last_insert_row_id
    end
  end
end
