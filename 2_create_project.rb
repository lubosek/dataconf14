require 'json'
require 'pp'
require 'rest-client'
require 'csv'
require 'gooddata'

GD_AUTH_TOKEN = 'AUTH-TOKEN'

GoodData.with_connection('username', 'password') do |c|
 
  blueprint = eval(File.read('./model/model.rb'))

  project = GoodData::Project.create_from_blueprint(blueprint, :auth_token => GD_AUTH_TOKEN)
  puts "Created project #{project.pid}"
  
  GoodData::with_project(project.pid) do |p|
   
    GoodData::Model.upload_data('./data/break.csv', blueprint, 'break')
    
    GoodData::Model.upload_data('./data/tweets.csv', blueprint, 'tweets')
    
    GoodData::Model.upload_data('./data/coffee.csv', blueprint, 'coffee')
    
    
    puts "Data Uploaded"
	
  end
end
