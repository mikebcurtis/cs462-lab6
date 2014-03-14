ruleset location_data {
  meta {
    name "Location Data"
    description <<
      Interacts with foursquare.
    >>
    author "Mike Curtis"
    logging off
    provides get_location_data
  }
  dispatch {
  }
  global {
    get_location_data = function(key) {
      ent:my_map{key};
    };
  }
  rule add_location_item {
    select when pds new_location_data
    pre {
      key = event:attr('key');
      value = event:attr('value');
      new_map = ent:my_map || {};
    }
    fired {
      set ent:my_map{key} value;
    }
  }
}
