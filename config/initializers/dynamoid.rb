require 'dynamoid'

module CallShibe

  Dynamoid.configure do |config|
    config.adapter = 'aws_sdk_v2' # This adapter establishes a connection to the DynamoDB servers using Amazon's own AWS gem.
    config.namespace = Configuration.namespace # To namespace tables created by Dynamoid from other tables you might have.
    config.warn_on_scan = true # Output a warning to the logger when you perform a scan rather than a query on a table.
    config.read_capacity = 10 # Read capacity for your tables
    config.write_capacity = 5 # Write Capcity

    if CallShibe.environment == :development
      config.endpoint = 'http://localhost:8000'
    end

    Dir[File.join( File.expand_path('../../../app/models/', __FILE__), '*.rb')].each do |model|
      require model
    end
  end

end