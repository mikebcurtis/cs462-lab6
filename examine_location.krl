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
			checkin_map = LocationData:get_location_data("fs_checkin").encode();
			my_html = <<
				<p>#{checkin_map}</p>
			>>;
		}
		{
			SquareTag:inject_styling();
			CloudRain:createLoadPanel("CS 462 Lab 6: Data Storage Module", {}, my_html);
		}
	}
}
