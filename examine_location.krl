ruleset examine_location {
	meta {
		name "CS 462 Lab 6: Examine Location"
		description <<
			The third part of CS 462 lab 6
		>>
		author "Mike Curtis"
		logging off
		use module a169x701 alias CloudRain
		use module a41x186 alias SquareTag
		use module b505198x5 alias LocationData
	}
	dispatch {
	}
	global {
	}
	rule show_fs_location is active {
		select when web cloudAppSelected
		pre {
			raw = LocationData:get_location_data("fs_checkin_raw");
			checkin_map = LocationData:get_location_data("fs_checkin").decode();
			venue = checkin_map.pick("$..venue");
			city = checkin_map.pick("$..city");
			shout = checkin_map.pick("$..shout");
			createdAt = checkin_map.pick("$..createdAt");
			my_html = <<
			        <h5>Venue: #{venue}</h5>
			        <h5>City: #{city}</h5>
			        <h5>Shout: #{shout}</h5>
			        <h5>CreatedAt: #{createdAt}</h5>
					<h5>Raw: #{createdAt}</h5>
			>>;
		}
		{
			SquareTag:inject_styling();
			CloudRain:createLoadPanel("CS 462 Lab 6: Data Storage Module", {}, my_html);
		}
	}
}
