GoodData::Model::ProjectBlueprint.build("DataConf 2014 - Mashup") do |p|
    p.add_date_dimension('date')

	p.add_dataset('break') do |d|
		d.add_anchor("break_id")
    	d.add_label("break_name", :reference => "break_id")
    end
	
	p.add_dataset('tweets') do |d|
      d.add_attribute('tweet')
      d.add_fact('favorites')
      d.add_fact('retweets')
      d.add_attribute('user')
      d.add_date('date', :dataset => "date")
      d.add_reference('hour', :dataset => "break")
    end
      
    p.add_dataset('coffee') do |d|
    	d.add_fact('coffees')
    	d.add_reference('hour', :dataset => "break")
    	d.add_date('date', :dataset => "date")
    end
    
end
