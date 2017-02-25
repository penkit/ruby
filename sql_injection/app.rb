require 'uri'

get '/animals/:id' do
  # Assigns MYSQL_URL from env
  mysql_url = ENV["MYSQL_URL"]

  # Parses URL
  uri = URI.parse(URI.encode(mysql_url))
  uri.path.slice!(0)

  # Connect to db
  connection = Mysql2::Client.new(host: uri.host, username: uri.user, password: uri.password, port: uri.port, database: uri.path)
  # Query db
  result = connection.query("SELECT * FROM animals WHERE id = #{params[:id]};")
  
  # Display result in view
  "#{result.first["name"]}"
end