require 'sqlite3'

if File.exists?("maindata.db")
    File.delete("maindata.db")
end

db = SQLite3::Database.new("maindata.db")
db.execute <<-SQL
    create table users(
      id integer primary key,
      email varchar,
      password varchar);
  SQL
db.execute("insert into users(email, password) values(?, ?);", ["pamela@example.com", "pass123"])
db.execute("insert into users(email, password) values(?, ?);", ["serena@example.com", "pass123"])
db.execute("insert into users(email, password) values(?, ?);", ["venus@example.com", "pass123"])

my_array = db.execute("SELECT * FROM users;")

puts my_array




